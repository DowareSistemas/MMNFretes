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
import entidades.Usuarios;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class LoginController
{

    @RequestMapping("/paginalogin")
    public ModelAndView redirecionaLogin()
    {
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("usuarioExiste", false);
        return mav;
    }

    @RequestMapping("/efetualogin")
    public @ResponseBody
    String efetualogin(Usuarios usuario, HttpSession httpSession)
    {
        Session session = SessionProvider.openSession();

        Criteria c = session.createCriteria(usuario, RESULT_TYPE.UNIQUE);
        c.add(Restrictions.eq(FILTER_TYPE.WHERE, "email", usuario.getEmail()));
        c.add(Restrictions.eq(FILTER_TYPE.AND, "senha", usuario.getSenha()));
        c.add(Restrictions.eq(FILTER_TYPE.AND, "inativo", false));
        c.execute();
        session.close();
        
        if (usuario.getId() != 0)
        {
            if (Util.isUsuario(usuario))
            {
                session.close();
                httpSession.setAttribute("usuarioLogado", usuario);
                return "areausuario";
            }
            else
            {
                session.close();
                httpSession.setAttribute("usuarioLogado", usuario);
                return "areatransportador";
            }
        }

        return "incorreto";
    }
}
