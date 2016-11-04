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
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Transportadoras;
import entidades.Usuarios;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;
import org.springframework.web.servlet.ModelAndView;
import util.Tipo_carga;
import util.Util;

/**
 *
 * @author emers
 */
@Controller
public class TransportadorasController
{

    @RequestMapping("/areatransportador")
    public ModelAndView redireciona(HttpSession session)
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");

        if (!Util.isUsuario(usuario))
        {
            List<Tipo_carga> tipos_carga = new ArrayList<Tipo_carga>();
            tipos_carga.add(new Tipo_carga(1, "Kilos"));
            tipos_carga.add(new Tipo_carga(2, "Toneladas"));
            tipos_carga.add(new Tipo_carga(3, "Passageiros"));

            VeiculosController veiculosController = new VeiculosController();

            ModelAndView modelAndView = new ModelAndView("areatransportador");
            modelAndView.addObject("tipos_carga", tipos_carga);
            modelAndView.addObject("categorias_veiculos", veiculosController.getCategorias());
            modelAndView.addObject("carrocerias", veiculosController.getCarrocerias());
            return modelAndView;
        } else
            return new ModelAndView("");
    }

    @RequestMapping(value = "/infoTransportador", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String getInfo(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                .execute();
        session.close();

        Gson gson = new Gson();
        return gson.toJson(transportadora);
    }

    public Transportadoras getByUsuario(int usuario_id)
    {
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario_id))
                .execute();
        session.close();

        return transportadora;
    }

    @RequestMapping("/alteraInfoTransportadora")
    public @ResponseBody
    String alteraInfoTransportadora(Transportadoras transportadora, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        int idTransportadora = getIdTransportadora(usuarioLogado.getId());

        transportadora.getUsuarios().setId(usuarioLogado.getId());
        transportadora.getUsuarios().setTipo_usuario(usuarioLogado.getTipo_usuario());
        transportadora.setNome(transportadora.getUsuarios().getNome());
        transportadora.setId(idTransportadora);

        Session session = SessionProvider.openSession();
        session.update(transportadora);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping("/alteraStatusCartao")
    public @ResponseBody
    String alteraCartao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = getTransportadora(usuario.getId());
        transportadora.setCartao(status);

        Session session = SessionProvider.openSession();
        session.update(transportadora);
        session.commit();
        session.close();
        return "OK";
    }

    @RequestMapping("/alteraStatusBoleto")
    public @ResponseBody
    String alteraBoleto(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Session session = null;

        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = getTransportadora(usuario.getId());
            transportadora.setBoleto(status);

            session = SessionProvider.openSession();
            session.update(transportadora);
            session.commit();
            session.close();
            return "OK";

        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            return "ERRO";
        }
    }

    @RequestMapping("/alteraStatusNegociacao")
    public @ResponseBody
    String alteraNegociacao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = getTransportadora(usuario.getId());
        transportadora.setNegociacao_direta(status);

        Session session = SessionProvider.openSession();
        session.update(transportadora);
        session.commit();
        session.close();
        return "OK";
    }

    private Transportadoras getTransportadora(int idUsuario)
    {
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();
        session.close();

        return transportadora;
    }

    private int getIdTransportadora(int idUsuario)
    {
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();
        session.close();

        return transportadora.getId();
    }
}
