/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entidades.Usuarios;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author emers
 */
@Controller
public class AdministracaoController
{

    @RequestMapping("/admin")
    public String redireciona(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        if(usuario == null)
            return "redirect:login";
        return (usuario.isAdmin()
                ? "admin"
                : "redirect:login");
    }
}
