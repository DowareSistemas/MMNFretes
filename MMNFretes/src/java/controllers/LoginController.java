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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sessionProvider.ConfigureSession;
import util.Util;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class LoginController
{

    @RequestMapping("/paginaLogin")
    public String redirecionaLogin()
    {
        return "login";
    }

    @RequestMapping("/efetuaLogin")
    public String efetuaLogin(Usuarios usuario, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            session = ConfigureSession.getSession();

            Criteria c = session.createCriteria(usuario, RESULT_TYPE.UNIQUE);
            c.add(Restrictions.eq(FILTER_TYPE.WHERE, "email", usuario.getEmail()));
            c.add(Restrictions.eq(FILTER_TYPE.AND, "senha", usuario.getSenha()));
            c.execute();

            if (usuario.getId() != 0)
            {
                if (Util.isUsuario(usuario))
                {
                    session.close();
                    httpSession.setAttribute("usuarioLogado", usuario);
                    return "redirect:areausuario";
                } else
                {
                    session.close();
                    httpSession.setAttribute("usuarioLogado", usuario);
                    return "redirect:areatransportador";
                }
            }

            session.close();
            return "redirect:paginaLogin";
        } catch (Exception ex)
        {
            if (session != null)
                session.close();
            
            return "redirect:paginaLogin";
        }
    }
}
