/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.MATCH_MODE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.ICriteria;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Query;
import com.google.gson.Gson;
import entidades.Cotacoes;
import entidades.Oportunidades;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import entidadesTemporarias.ResultadoLancamento;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class OportunidadesController
{

    @RequestMapping("lancamentos")
    public ModelAndView redirectLancamentos(HttpSession httpSession)
    {
        return list(httpSession);
    }

    @RequestMapping(value = "/detalhes-oportunidade", produces = "application/json; charset=utf-8")
    public @ResponseBody
    String find(@RequestParam(value = "id") int id)
    {
        Session session = SessionProvider.openSession();
        Oportunidades op = session.onID(Oportunidades.class, id);
        session.close();

        return new Gson().toJson(op);
    }

    @RequestMapping(value = "/salva-oportunidade")
    public @ResponseBody
    String add(Oportunidades oportunidade)
    {
        Session session = SessionProvider.openSession();

        if (session.count(Oportunidades.class, "id = " + oportunidade.getId()) > 0)
            session.update(oportunidade);
        else
            session.save(oportunidade);

        session.commit();
        session.close();

        return (oportunidade.saved || oportunidade.updated
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/remove-oportunidade")
    public @ResponseBody
    String remove(@RequestParam(value = "id") int id)
    {
        removeOportunidade(id);
        return "1";
    }

    private List<Integer> categorias = new ArrayList<Integer>();
    private List<Integer> carrocerias = new ArrayList<Integer>();
    private List<Integer> tipos_carga = new ArrayList<Integer>();

    @RequestMapping(value = "/lista-oportunidades")
    public ModelAndView list(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        String resultView = "";

        if (Util.isUsuario(usuario))
        {
            resultView = "oportunidades-usr";
            return oportunidades_usr(resultView, usuario.getId());
        }
        else
        {
            resultView = "lancamentos";
            return oportunidades_transp(resultView, httpSession);
        }
    }

    private ModelAndView oportunidades_usr(String resultView, int usuario_id)
    {
        Oportunidades op = new Oportunidades();

        Session session = SessionProvider.openSession();
        session.createCriteria(op, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario_id))
                .execute();
        session.close();

        ModelAndView mav = new ModelAndView(resultView);
        mav.addObject("oportunidades", op.toList());
        return mav;
    }

    @RequestMapping(value = "/salvalancamento",
            produces = "application/json; charset=utf-8",
            method = RequestMethod.POST)
    public @ResponseBody
    String salvaLancamento(Oportunidades oportunidade, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        oportunidade.setUsuarios_id(usuarioLogado.getId());

        Session session = SessionProvider.openSession();
        session.save(oportunidade);
        session.commit();
        session.close();

        return (oportunidade.saved
                ? "1"
                : "0");
    }

    private ModelAndView oportunidades_transp(String resultView, HttpSession httpSession)
    {
        List<Veiculos> veiculos = new VeiculosController().getList(httpSession);
        if (veiculos.isEmpty())
            return new ModelAndView(resultView);

        for (Veiculos v : veiculos)
        {
            if (!categorias.contains(v.getCategorias_veiculos_id()))
                categorias.add(v.getCategorias_veiculos_id());

            if (!carrocerias.contains(v.getCarrocerias_id()))
                carrocerias.add(v.getCarrocerias_id());

            if (!tipos_carga.contains(v.getTipo_carga()))
                tipos_carga.add(v.getTipo_carga());
        }

        Oportunidades op = new Oportunidades();
        Usuarios usuarios = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transp = new TransportadorasController().getByUsuario(usuarios.getId());

        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(op, RESULT_TYPE.MULTIPLE);
        c.add(JOIN_TYPE.INNER, usuarios, "oportunidades.usuarios_id = usuarios.id");

        c.beginPrecedence();

        for (int i = 0; i < categorias.size(); i++)
        {
            if (i == 0)
            {
                if (categorias.get(i) > 0)
                    c.add(Restrictions.like(FILTER_TYPE.WHERE, "categorias", categorias.get(i) + "", MATCH_MODE.ANYWHERE));
                continue;
            }

            if (categorias.get(i) > 0)
                c.add(Restrictions.like(FILTER_TYPE.OR, "categorias", categorias.get(i) + "", MATCH_MODE.ANYWHERE));
        }

        for (int i = 0; i < carrocerias.size(); i++)
            if (carrocerias.get(i) > 0)
                c.add(Restrictions.like(FILTER_TYPE.OR, "carrocerias", carrocerias.get(i) + "", MATCH_MODE.ANYWHERE));

        for (int i = 0; i < tipos_carga.size(); i++)
            if (tipos_carga.get(i) > 0)
                c.add(Restrictions.like(FILTER_TYPE.OR, "tipo_carga", tipos_carga.get(i) + "", MATCH_MODE.ANYWHERE));

        c.endPrecedence();

        String[] oportunidadesEmNegociacao = oportunidadesEmNegociacao(session, transp.getId());
        if (oportunidadesEmNegociacao.length > 0)
            c.add(Restrictions.notIn(FILTER_TYPE.AND, "oportunidades.id", oportunidadesEmNegociacao));

        c.execute();
        c.loadList(op);
        c.loadList(usuarios);
        session.close();

        List<Oportunidades> l_op = op.toList();
        List<Usuarios> l_usr = usuarios.toList();

        List<ResultadoLancamento> resultados = new ArrayList<ResultadoLancamento>();

        for (int i = 0; i < l_op.size(); i++)
        {
            l_op.get(i).setUsuarios(l_usr.get(i));

            List<Veiculos> v_result = new VeiculosController().listByPerfil(
                    l_op.get(i).getCategorias(),
                    l_op.get(i).getCarrocerias(),
                    l_op.get(i).getTipo_carga(),
                    transp.getId());

            if (v_result.size() > 0)
                resultados.add(new ResultadoLancamento(l_op.get(i), v_result));
        }

        ModelAndView mav = new ModelAndView(resultView);
        mav.addObject("resultados", resultados);
        return mav;
    }

    private String[] oportunidadesEmNegociacao(Session session, int transportadora_id)
    {
        Cotacoes c = new Cotacoes();
        Query q = session.createQuery(c,
                "select * from cotacoes where transportadoras_id = "
                + transportadora_id + " and oportunidade_id > 0");

        q.setResult_type(RESULT_TYPE.MULTIPLE);
        q.execute();

        List<Cotacoes> cotacoes = c.toList();
        String[] retorno = new String[cotacoes.size()];

        if (cotacoes.size() > 0)
        {
            for (int i = 0; i < cotacoes.size(); i++)
                retorno[i] = (cotacoes.get(i).getOportunidade_id() + "");
        }

        return retorno;
    }

    public void removeOportunidade(int id)
    {
        Session session = SessionProvider.openSession();
        Oportunidades o = session.onID(Oportunidades.class, id);
        session.delete(o);

        session.createQuery(new Cotacoes(), "update cotacoes set oportunidade_id = 0 where oportunidade_id = " + id)
                .execute();

        session.commit();
        session.close();
    }
}
