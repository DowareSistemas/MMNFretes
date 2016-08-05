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
        /*  String url = request.getRequestURI();
        
        if(url.contains("adicionaEndereco") || url.contains("paginaLogin") || url.contains("cadastratransportadora") || url.contains("cadastrausuario") || url.contains("efetuaLogin") || url.contains("resources"))
        {
            return true;
        }
        
        if(request.getSession().getAttribute("usuarioLogado") != null)
        {
            return true;
        }
        else
        {
            response.sendRedirect("paginaLogin");
            return false;
        } */

        return true;
    }
}
