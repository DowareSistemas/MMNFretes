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
import java.nio.charset.Charset;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class UsuariosController
{

    @RequestMapping("/cadastrausuario")
    public String gravaUsuario(Usuarios usuario, HttpSession httpSession)
    {
        if(usuarioExiste(usuario)) return "redirect:paginaLogin"; 
        usuario.setTipo_usuario(0);

        Session session = null;
        try
        {
            session = SessionProvider.openSession();
            session.save(usuario);
            session.commit();
            session.close();

            httpSession.setAttribute("usuarioLogado", usuario);

            return "redirect:areausuario";
        } catch (Exception ex)
        {
            if (session != null)
                session.close();

            return "erro";
        }
    }

    private boolean usuarioExiste(Usuarios usuario)
    {
        Session session = null;

        try
        {
            session = SessionProvider.openSession();
            session.createCriteria(usuario, RESULT_TYPE.MULTIPLE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "email", usuario.getEmail()))
                    .execute();
            
            boolean result = false;
            
            if(usuario.ResultList.size() > 0) result = true;
            session.close();
            
            return result;
        } 
        catch (Exception ex)
        {
            if(session != null) session.close();
        }
        
        return false;
    }

    @RequestMapping(value = "/alteraInfoUsuario")
    public @ResponseBody
    String alteraInfoUsuario(Usuarios usuario, HttpSession httpSession)
    {
        Session session = null;

        try
        {
            if(usuario.getNome().equals("undefined")) return "";

            Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
            usuario.setId(usuarioLogado.getId());

            session = SessionProvider.openSession();
            session.update(usuario);
            session.commit();
            session.close();

            return "infoUsuario";
        } catch (Exception ex)
        {
            if (session != null)
                session.close();

            return "erro";
        }
    }

    @RequestMapping(value = "/infoUsuario", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    public @ResponseBody
    String infoUsuario(HttpSession httpSession, HttpServletResponse response)
    {
        Session session = null;

        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

            session = SessionProvider.openSession();
            session.onID(usuario, usuario.getId());
            session.close();
            
            Gson gson = new Gson();
            String resultado = gson.toJson(usuario);
            return resultado;
        } catch (Exception ex)
        {
            if (session != null)
                session.close();

            return "erro";
        }
    }

    @RequestMapping("/cadastratransportadora")
    public String gravaTransportadora(Transportadoras transportadoras, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            transportadoras.getUsuarios().setTipo_usuario(1);
            transportadoras.getUsuarios().setNome(transportadoras.getNome());

            session = SessionProvider.openSession();
            session.save(transportadoras);
            session.commit();
            session.close();

            httpSession.setAttribute("usuarioLogado", transportadoras.getUsuarios());

            return "redirect:areatransportador";

        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            return "erro";
        }
    }

    @RequestMapping("/areausuario")
    public String rediriocionaAreaUsuario(HttpSession session
    )
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");

        if (Util.isUsuario(usuario))
        {
            return "areausuario";
        } else
        {
            return "redirect:paginaLogin";
        }
    }
}
