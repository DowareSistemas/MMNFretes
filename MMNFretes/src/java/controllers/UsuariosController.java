/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import br.com.persistor.sessionManager.SessionFactory;
import entidades.Usuarios;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sessionProvider.ConfigureSession;

/**
 * 
 * @author Marcos Vinícius
 */
@Controller
public class UsuariosController 
{
    @RequestMapping("/cadastrausuario")
    public String gravaUsuario(Usuarios usuario)
    {
      /*  SessionFactory session = new ConfigureSession().getSession();
        session.save(usuario);
        session.close();
        */
        
        return "areausuario";
    }
}
