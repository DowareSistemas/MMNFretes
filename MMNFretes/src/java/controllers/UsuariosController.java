/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.interfaces.Session;
import entidades.Enderecos;
import entidades.Transportadoras;
import entidades.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.ConfigureSession;

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
        usuario.setTipo_usuario(0);
        
        Session session = ConfigureSession.getSession();
        session.save(usuario);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", usuario);
        
        return "areausuario";
    }

    @RequestMapping("/cadastratransportadora")
    public String gravaTransportadora(Transportadoras transportadoras, HttpSession httpSession)
    {
        transportadoras.getUsuarios().setTipo_usuario(1);
        transportadoras.getUsuarios().setNome(transportadoras.getNome());
        
        Session session = ConfigureSession.getSession();
        session.save(transportadoras);
        session.commit();
        session.close();

        httpSession.setAttribute("usuarioLogado", transportadoras.getUsuarios());
        
        return "areausuario";
    }
    
    @RequestMapping("/testeLista")
    public String redirectLista()
    {
        return "testeLista";
    }
    
    @RequestMapping("/areausuario")
    public String rediriocionaAreaUsuario()
    {
        return "areausuario";
    }
}
