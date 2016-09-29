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
import sessionProvider.ConfigureSession;
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
            tipos_carga.add(new Tipo_carga(1, "Toneladas"));
            tipos_carga.add(new Tipo_carga(2, "Passageiros"));

            List<Categorias_veiculos> categorias_veiculos = new VeiculosController().getCategorias();
            
            ModelAndView modelAndView = new ModelAndView("areatransportador");
            modelAndView.addObject("tipos_carga", tipos_carga);
            modelAndView.addObject("categorias_veiculos", categorias_veiculos);
            return modelAndView;
        }
        else
        {
            return new ModelAndView("");
        }
    }

    @RequestMapping(value = "/infoTransportador", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String getInfo(HttpSession httpSession)
    {
        Session session = null;

        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = new Transportadoras();

            session = ConfigureSession.getSession();
            session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                    .execute();

            Gson gson = new Gson();
            session.close();

            return gson.toJson(transportadora);

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return " ";
        }
    }

    public Transportadoras getByUsuario(int usuario_id)
    {
        Session session = null;
        try
        {
            Transportadoras t = new Transportadoras();

            session = ConfigureSession.getSession();
            session.createCriteria(t, RESULT_TYPE.UNIQUE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario_id))
                    .execute();
            session.close();

            return t;

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return new Transportadoras();
        }
    }

    @RequestMapping("/alteraInfoTransportadora")
    public @ResponseBody
    String alteraInfoTransportadora(Transportadoras transportadora, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
            int idTransportadora = getIdTransportadora(usuarioLogado.getId());

            transportadora.getUsuarios().setId(usuarioLogado.getId());
            transportadora.getUsuarios().setTipo_usuario(usuarioLogado.getTipo_usuario());
            transportadora.setNome(transportadora.getUsuarios().getNome());
            transportadora.setId(idTransportadora);

            session = ConfigureSession.getSession();
            session.update(transportadora);
            session.update(transportadora.getUsuarios());

            session.commit();
            session.close();

            return "OK";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return " ";
        }
    }

    @RequestMapping("/alteraStatusCartao")
    public @ResponseBody
    String alteraCartao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = getTransportadora(usuario.getId());
            transportadora.setCartao(status);

            session = ConfigureSession.getSession();
            session.update(transportadora);
            session.commit();
            session.close();
            return "OK";

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }

            return " ";
        }
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

            session = ConfigureSession.getSession();
            session.update(transportadora);
            session.commit();
            session.close();
            return "OK";

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return "ERRO";
        }
    }

    @RequestMapping("/alteraStatusNegociacao")
    public @ResponseBody
    String alteraNegociacao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            session = ConfigureSession.getSession();

            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = getTransportadora(usuario.getId());
            transportadora.setNegociacao_direta(status);

            session.update(transportadora);
            session.commit();
            session.close();
            return "OK";

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return "ERRO";
        }
    }

    private Transportadoras getTransportadora(int idUsuario) throws Exception
    {
        Session session = null;

        try
        {
            Transportadoras transportadora = new Transportadoras();

            session = ConfigureSession.getSession();
            session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                    .execute();
            session.close();

            return transportadora;
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }

            throw new Exception(ex.getMessage());
        }
    }

    private int getIdTransportadora(int idUsuario)
    {
        Session session = null;
        try
        {
            session = ConfigureSession.getSession();

            Transportadoras transportadora = new Transportadoras();

            session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                    .execute();

            session.close();

            return transportadora.getId();
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }

            return 0;
        }
    }
}
