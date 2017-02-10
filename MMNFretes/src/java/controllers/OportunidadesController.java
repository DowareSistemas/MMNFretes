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
import com.google.gson.Gson;
import entidades.Oportunidades;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.catalina.ha.session.BackupManager;
import org.apache.catalina.session.StandardSession;
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
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuario_id", usuario_id))
                .execute();
        session.close();

        ModelAndView mav = new ModelAndView(resultView);
        mav.addObject("oportunidades", session.getList(op));
        return mav;
    }

    @RequestMapping(value = "/salvalancamento",
            produces = "application/json; charset=utf-8", 
            method = RequestMethod.POST)
    public @ResponseBody
    String salvaLancamento(Oportunidades oportunidade, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        oportunidade.setUsuario_id(usuarioLogado.getId());
        
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
        Usuarios usuarios = new Usuarios();

        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(op, RESULT_TYPE.MULTIPLE);
        c.add(JOIN_TYPE.INNER, usuarios, "oportunidades.usuario_id = usuarios.id");

        for (int i = 0; i < categorias.size(); i++)
        {
            if (i == 0)
            {
                c.add(Restrictions.like(FILTER_TYPE.WHERE, "categorias", i + "", MATCH_MODE.ANYWHERE));
                continue;
            }

            c.add(Restrictions.like(FILTER_TYPE.OR, "categorias", i + "", MATCH_MODE.ANYWHERE));
        }

        for (int i = 0; i < carrocerias.size(); i++)
        {
            c.add(Restrictions.like(FILTER_TYPE.OR, "carrocerias", i + "", MATCH_MODE.ANYWHERE));
        }

        for (int i = 0; i < tipos_carga.size(); i++)
        {
            c.add(Restrictions.like(FILTER_TYPE.OR, "tipo_carga", i + "", MATCH_MODE.ANYWHERE));
        }

        c.execute();
        c.loadList(op);
        c.loadList(usuarios);
        session.close();

        List<Oportunidades> l_op = session.getList(op);
        List<Usuarios> l_usr = session.getList(usuarios);

        for (int i = 0; i < l_op.size(); i++)
        {
            l_op.get(i).setUsuarios(l_usr.get(i));
        }

        ModelAndView mav = new ModelAndView(resultView);
        mav.addObject("oportunidades", l_op);
        return mav;
    }

    public void removeOportunidade(int id)
    {
        Session session = SessionProvider.openSession();
        Oportunidades o = session.onID(Oportunidades.class, id);
        session.delete(o);
        session.commit();
        session.close();
    }
}
