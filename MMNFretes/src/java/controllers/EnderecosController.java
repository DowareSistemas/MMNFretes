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
import br.com.persistor.sessionManager.Criteria;
import com.google.gson.Gson;
import entidades.Enderecos;
import entidades.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.ConfigureSession;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class EnderecosController
{

    @RequestMapping(value = "/adicionaEndereco")
    public String adicionar(Model model, Enderecos endereco, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            endereco.setUsuarios_id(usuario.getId());
            endereco.setInativo(false);

            session = ConfigureSession.getSession();
            session.save(endereco);
            session.commit();

            session.close();
        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            return "erro";
        }
        return "redirect:listaEnderecos";
    }

    @RequestMapping(value = "/carregaEndereco", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String carregaEndereco(@PathParam(value = "endereco_id") int endereco_id)
    {
        Session session = null;
        try
        {
            Enderecos endereco = new Enderecos();

            session = ConfigureSession.getSession();
            session.onID(endereco, endereco_id);
            session.close();

            Gson gson = new Gson();
            return gson.toJson(endereco);

        } catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return "erro";
        }
    }

    @RequestMapping("/listaEnderecos")
    public ModelAndView listaEnderecos(HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Enderecos endereco = new Enderecos();

            session = ConfigureSession.getSession();
            session.createCriteria(endereco, RESULT_TYPE.MULTIPLE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                    .add(Restrictions.eq(FILTER_TYPE.AND, "inativo", "false"))
                    .execute();

            List<Enderecos> listaEnderecos = endereco.ResultList;

            ModelAndView modelAndView = new ModelAndView("listaenderecos");
            modelAndView.addObject("listaenderecos", listaEnderecos);

            session.close();

            return modelAndView;

        } catch (Exception ex)
        {
            if (session != null)
                session.close();

            return new ModelAndView("erro");
        }
    }

    @RequestMapping("/alteraEndereco")
    public String alteraEndereco(@PathParam(value = "endereco_id") int endereco_id, Enderecos endereco, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            endereco.setId(endereco_id);
            endereco.setUsuarios_id(usuario.getId());

            session = ConfigureSession.getSession();
            session.update(endereco);
            session.commit();
            session.close();

            return "redirect:listaEnderecos";
        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            return "erro";
        }
    }

    @RequestMapping(value = "/inativaEndereco", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    String inativaEndereco(@PathParam(value = "endereco_id") int endereco_id)
    {
        Session session = null;
        try
        {
            session = ConfigureSession.getSession();
            Enderecos endereco = (Enderecos) session.onID(Enderecos.class, endereco_id);
            endereco.setInativo(true);

            session.delete(endereco);
            session.commit();
            session.close();

            return "Endereço inativado!";
        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            return " ";
        }
    }
}
