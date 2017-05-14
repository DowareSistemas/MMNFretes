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
import entidades.Cidades;
import entidades.Enderecos;
import entidades.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class EnderecosController
{

    @RequestMapping(value = "/adicionaEndereco", method = RequestMethod.POST)
    public @ResponseBody
    String adicionar(Enderecos endereco, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        endereco.setUsuarios_id(usuario.getId());
        endereco.setInativo(false);

        Session session = SessionProvider.openSession();
        session.save(endereco);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping(value = "/carregaEndereco", produces = "application/json; charset=utf-8")
    public @ResponseBody
    String carregaEndereco(@PathParam(value = "endereco_id") int endereco_id)
    {
        Session session = SessionProvider.openSession();
        Enderecos endereco = session.onID(Enderecos.class, endereco_id);
        session.close();

        Gson gson = new Gson();
        return gson.toJson(endereco);
    }

    @RequestMapping("/listaEnderecos")
    public ModelAndView listaEnderecos(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Enderecos endereco = new Enderecos();

        Session session = SessionProvider.openSession();
        session.createCriteria(endereco, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                .add(Restrictions.eq(FILTER_TYPE.AND, "inativo", false))
                .execute();
        session.close();

        List<Enderecos> listaEnderecos = endereco.toList();

        ModelAndView modelAndView = new ModelAndView("listaenderecos");
        modelAndView.addObject("listaenderecos", listaEnderecos);

        return modelAndView;
    }

    @RequestMapping(value = "/alteraEndereco", method = RequestMethod.POST)
    public @ResponseBody
    String alteraEndereco(Enderecos endereco, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        endereco.setUsuarios_id(usuario.getId());

        Session session = SessionProvider.openSession();
        session.update(endereco);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping(value = "get-municipio", method = RequestMethod.POST)
    public @ResponseBody
    String getMunicipioByCodigo(@RequestParam(value = "codigo_municipio") int cod_mun)
    {
        Session session = SessionProvider.openSession();
        Cidades cidade = session.onID(Cidades.class, cod_mun);
        session.close();

        return cidade.getNome();
    }

    @RequestMapping(value = "/inativaEndereco", method = RequestMethod.POST)
    public @ResponseBody
    String inativaEndereco(@PathParam(value = "endereco_id") int endereco_id)
    {
        Session session = SessionProvider.openSession();

        Enderecos endereco = session.onID(Enderecos.class, endereco_id);
        endereco.setInativo(true);

        session.update(endereco);
        session.commit();
        session.close();

        return "Endereço inativado!";
    }
}
