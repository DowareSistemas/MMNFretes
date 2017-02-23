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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class UsuariosController
{

    @RequestMapping(value = "/cadastrausuario", method = RequestMethod.POST)
    public ModelAndView gravaUsuario(Usuarios usuario, HttpSession httpSession)
    {
        if (usuarioExiste(usuario))
        {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("usuarioExiste", true);
            return mav;
        }

        usuario.setTipo_usuario(0);

        Session session = SessionProvider.openSession();
        session.save(usuario);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", usuario);

        return new ModelAndView("redirect:areausuario");
    }

    @RequestMapping(value = "/cadastratransportadora", method = RequestMethod.POST)
    public ModelAndView gravaTransportadora(Transportadoras transportadoras, HttpSession httpSession)
    {
        if (usuarioExiste(transportadoras.getUsuarios()))
        {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("usuarioExiste", true);
            return mav;
        }

        transportadoras.getUsuarios().setTipo_usuario(1);
        transportadoras.getUsuarios().setNome(transportadoras.getNome());

        Session session = SessionProvider.openSession();
        session.save(transportadoras);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", transportadoras.getUsuarios());

        return new ModelAndView("redirect:areatransportador");
    }

    /**
     * Para verificar se existe mais de uma pessoa com o mesmo email
     *
     * @param usuario
     * @return
     */
    private boolean usuarioExiste(Usuarios usuario)
    {
        Session session = SessionProvider.openSession();
        session.createCriteria(usuario, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "email", usuario.getEmail()))
                .execute();
        session.close();

        return (usuario.ResultList.size() > 0); // se for maior que 0, existe
    }

    @RequestMapping(value = "/alteraInfoUsuario", method = RequestMethod.POST)
    public @ResponseBody
    String alteraInfoUsuario(Usuarios usuario, HttpSession httpSession)
    {
        if (usuario.getNome().equals("undefined"))
            return "";

        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        usuario.setId(usuarioLogado.getId());

        Session session = SessionProvider.openSession();
        session.update(usuario);
        session.commit();
        session.close();

        return "infoUsuario";
    }

    @RequestMapping(value = "tipo_usuario")
    public @ResponseBody
    String getTipoUsuario(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        
        if(usuario == null)
            return "-1";
        
        return (Util.isUsuario(usuario)
                ? "0"
                : "1");
    }
    
    @RequestMapping(value = "/infoUsuario", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    public @ResponseBody
    String infoUsuario(HttpSession httpSession, HttpServletResponse response)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        Session session = SessionProvider.openSession();
        session.onID(usuario, usuario.getId());
        session.close();

        Gson gson = new Gson();
        String resultado = gson.toJson(usuario);
        return resultado;
    }

    @RequestMapping(value = "/usuarioatual", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
    public @ResponseBody
    String getUsuarioAtual(HttpSession session)
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");
        return (usuario == null
                ? "0"
                : usuario.getId() + "");
    }

    @RequestMapping(value = "/paginaperfil")
    public String paginaPerfil(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        
        if(usuario.isAdmin())
            return "redirect:admin";
        
        if (Util.isUsuario(usuario))
            return "redirect:areausuario";
        else
            return "redirect:areatransportador";
    }

    @RequestMapping("/areausuario")
    public String rediriocionaAreaUsuario(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");

        if (Util.isUsuario(usuario))
            return "areausuario";
        else
            return "redirect:paginalogin";
    }

    @RequestMapping("/loggout")
    public String loggout(HttpSession httpSession)
    {
        httpSession.setAttribute("usuarioLogado", null);
        return "redirect:pesquisar";

    }
}
