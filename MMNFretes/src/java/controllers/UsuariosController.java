/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.sessionManager.SessionFactory;
import entidades.Transportadoras;
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
       // usuario.setTipo_usuario(0);
        
     //   SessionFactory session = new ConfigureSession().getSession();
      /*  SessionFactory session = new ConfigureSession().getSession();
        session.save(usuario);
        session.commit();
        session.close();
        */
        


        return "areausuario";
    }

    @RequestMapping("/cadastratransportadora")
    public String gravaTransportadora(Transportadoras transportadoras)
    {
        transportadoras.getUsuarios().setTipo_usuario(1);
        transportadoras.getUsuarios().setNome(transportadoras.getNome());
        
        SessionFactory session = new ConfigureSession().getSession();
        session.save(transportadoras);
        session.commit();
        session.close();

        return "areausuario";
    }
    
    @RequestMapping("/areausuario")
    public String rediriocionaAreaUsuario()
    {
        return "areausuario";
    }
}
