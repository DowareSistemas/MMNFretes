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
import entidades.Historico;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class HistoricoController
{

    @RequestMapping(value = "/listaHistorico", method = RequestMethod.POST)
    public ModelAndView listaHistorico(@RequestParam(value = "searchTerm") String busca, HttpSession httpSession)
    {

        Historico historico = new Historico();
        Transportadoras t = new Transportadoras();
        Usuarios u = new Usuarios();
        Veiculos v = new Veiculos();

        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");

        ModelAndView mav = (Util.isUsuario(usuarioLogado)
                ? new ModelAndView("listahistorico-usuario")
                : new ModelAndView("listahistorico-transportador"));

        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(historico, RESULT_TYPE.MULTIPLE);
        c.add(JOIN_TYPE.INNER, t, "historico.transportadoras_id = transportadoras.id");
        c.add(JOIN_TYPE.INNER, v, "historico.veiculos_id = veiculos.id");
        c.add(JOIN_TYPE.INNER, u, "historico.usuarios_id = usuarios.id");
        c.addJoinIgnoreField("foto");

        if (Util.isUsuario(usuarioLogado))
            c.add(Restrictions.eq(FILTER_TYPE.WHERE, "historico.usuarios_id", usuarioLogado.getId()));
        else
            c.add(Restrictions.eq(FILTER_TYPE.WHERE, "historico.transportadoras_id",
                    new TransportadorasController().getByUsuario(usuarioLogado.getId()).getId()));

        c.beginPrecedence();

        c.add(Restrictions.like(FILTER_TYPE.AND, "veiculos.descricao", busca, MATCH_MODE.ANYWHERE));
        if (Util.isUsuario(usuarioLogado))
            c.add(Restrictions.like(FILTER_TYPE.OR, "transportadoras.nome", busca, MATCH_MODE.ANYWHERE));
        else
            c.add(Restrictions.like(FILTER_TYPE.OR, "usuarios.nome", busca, MATCH_MODE.ANYWHERE));

        c.endPrecedence();

        c.execute();
        c.loadList(historico);
        c.loadList(t);
        c.loadList(v);
        c.loadList(u);
        session.close();

        List<Historico> list_historico = session.getList(historico);
        List<Transportadoras> list_transportadoras = session.getList(t);
        List<Veiculos> list_veiculos = session.getList(v);
        List<Usuarios> list_usuarios = session.getList(u);

        for (int i = 0; i < list_historico.size(); i++)
        {
            list_historico.get(i).setTransportadoras(list_transportadoras.get(i));
            list_historico.get(i).setVeiculos(list_veiculos.get(i));
            list_historico.get(i).setUsuarios(list_usuarios.get(i));
        }

        mav.addObject("list_historico", list_historico);
        return mav;
    }
}
