/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Marcos Vinícius
 */
public class Interceptador extends HandlerInterceptorAdapter
{

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        String url = request.getRequestURI();
        if (enderecoPermitido(url))
        {
            return true;
        }

        if (request.getSession().getAttribute("usuarioLogado") != null)
        {
            return true;
        }
        else
        {
            response.sendRedirect("paginalogin");
            return false;
        }
    }

    private boolean enderecoPermitido(String url)
    {
        if (url.contains("upload"))
        {
            return true;
        }

        if (url.contains("pesquisar"))
        {
            return true;
        }

        if (url.contains("cadastratransportadora"))
        {
            return true;
        }

        if (url.contains("cadastrausuario"))
        {
            return true;
        }

        if (url.contains("efetualogin"))
        {
            return true;
        }

        if (url.contains("resources"))
        {
            return true;
        }

        if (url.contains("paginalogin"))
        {
            return true;
        }

        if (url.contains("cadastratransportadora"))
        {
            return true;
        }

        if (url.contains("maps.googleapis.com/maps/api"))
        {
            return true;
        }

        if (url.contains("pesquisafrete"))
        {
            return true;
        }
        return false;
    }
}
