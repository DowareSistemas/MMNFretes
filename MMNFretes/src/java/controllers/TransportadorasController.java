/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Transportadoras;
import entidades.Usuarios;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.ConfigureSession;
import util.Util;

/**
 *
 * @author emers
 */
@Controller
public class TransportadorasController
{

    @RequestMapping("/areatransportador")
    public String redireciona(HttpSession session)
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");

        if (!Util.isUsuario(usuario))
        {
            return "areatransportador";
        } else
        {
            return "redirect:paginaLogin";
        }
    }

    @RequestMapping("/infoTransportador")
    public @ResponseBody
    String getInfo(HttpSession httpSession)
    {
        Session session = ConfigureSession.getSession();

        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = new Transportadoras();

        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                .execute();

        Gson gson = new Gson();

        session.close();

        return gson.toJson(transportadora);
    }

    @RequestMapping("/alteraInfoTransportadora")
    public @ResponseBody
    String alteraInfoTransportadora(Transportadoras transportadora, HttpSession httpSession)
    {
        Session session = ConfigureSession.getSession();
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");

        int idTransportadora = getIdTransportadora(usuarioLogado.getId());

        transportadora.getUsuarios().setId(usuarioLogado.getId());
        transportadora.getUsuarios().setTipo_usuario(usuarioLogado.getTipo_usuario());
        transportadora.setNome(transportadora.getUsuarios().getNome());
        transportadora.setId(idTransportadora);

        session.update(transportadora);
        session.update(transportadora.getUsuarios());

        session.commit();
        session.close();

        if (!transportadora.updated && !transportadora.getUsuarios().updated)
        {
            return "ERRO";
        }

        return "OK";
    }

    @RequestMapping("/alteraStatusCartao")
    public @ResponseBody
    String alteraCartao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Session session = ConfigureSession.getSession();

        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora  = getTransportadora(usuario.getId());
        transportadora.setCartao(status);

        session.update(transportadora);
        session.commit();
        session.close();
        return "OK";
    }

    private Transportadoras getTransportadora(int idUsuario)
    {
        Session session = ConfigureSession.getSession();

        Transportadoras transportadora = new Transportadoras();

        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();

        session.close();

        return transportadora;
    }

    private int getIdTransportadora(int idUsuario)
    {
        Session session = ConfigureSession.getSession();

        Transportadoras transportadora = new Transportadoras();

        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();

        session.close();

        return transportadora.getId();
    }
}
