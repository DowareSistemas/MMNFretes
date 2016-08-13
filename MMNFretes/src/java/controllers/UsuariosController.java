/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Transportadoras;
import entidades.Usuarios;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        
        return "redirect:areausuario";
    }

    @RequestMapping("/alteraInfoUsuario")
    public String alteraInfoUsuario(Usuarios usuario, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios)httpSession.getAttribute("usuarioLogado");
        
        usuario.setId(usuarioLogado.getId());
        
        Session session = ConfigureSession.getSession();
        
        session.update(usuario);
        session.commit();
        session.close();
        
        return "redirect:infoUsuario";
    }
    
    @RequestMapping("/infoUsuario")
    public @ResponseBody String infoUsuario(HttpSession httpSession)
    {
        Session session = ConfigureSession.getSession();
        
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        session.onID(usuario, usuario.getId());
        
        session.close();
        
        Gson gson = new Gson();
        String resultado = gson.toJson(usuario);
        
        return resultado;
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
