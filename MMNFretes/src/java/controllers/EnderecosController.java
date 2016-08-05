/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Enderecos;
import entidades.Usuarios;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.ConfigureSession;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class EnderecosController
{

    @RequestMapping(value = "/adicionaEndereco")
    public String adicionar(Model model, Enderecos endereco, HttpSession httpSession)
    {
      //  System.out.println(httpServletRequest.getRequestURI());
      /*  System.out.println(endereco.getCEP());
        System.out.println(endereco.getBairro());
        System.out.println(endereco.getLogradouro());
        System.out.println(endereco.getNumero());
        System.out.println(endereco.getComplemento());
        System.out.println(endereco.getUF());
        System.out.println("Municp " + endereco.getMunicipio()); */
        
        Session session = ConfigureSession.getSession();

        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        endereco.setUsuarios_id(1);
        endereco.setInativo(false);

        session.save(endereco);
        session.commit();

        session.close(); 
        
        return "redirect:listaEnderecos";
    }

    @RequestMapping("/carregaEndereco")
    public @ResponseBody String carregaEndereco(@PathParam(value = "endereco_id") int endereco_id)
    {
        System.out.println(endereco_id);
        Session session = ConfigureSession.getSession();
        
        Enderecos endereco = new Enderecos();
        session.onID(endereco, endereco_id);

        session.close();
        
        Gson gson = new Gson(); 
        
        return gson.toJson(endereco);
    }
    
    @RequestMapping("/listaEnderecos")
    public ModelAndView listaEnderecos(HttpSession httpSession)
    {
        Session session = ConfigureSession.getSession();
  
        Usuarios usuarios = (Usuarios) httpSession.getAttribute("usuarioLogado");

        session.loadWithJoin(usuarios, usuarios.getEnderecos());

        List<Enderecos> listaEnderecos = usuarios.getEnderecos().ResultList;

        ModelAndView modelAndView = new ModelAndView("listaenderecos");
        modelAndView.addObject("listaenderecos", listaEnderecos);

        session.close();

        return modelAndView; 
    } 
}
