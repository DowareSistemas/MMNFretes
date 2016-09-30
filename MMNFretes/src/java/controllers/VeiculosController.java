/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.interfaces.Session;
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Tipos_carga;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.ConfigureSession;

/**
 *
 * @author marcosvinicius
 */
@Controller
public class VeiculosController
{

    public List<Tipos_carga> getTipos_Carga()
    {
        Session session = null;
        try
        {
            Tipos_carga tipos_carga = new Tipos_carga();
            
            session = ConfigureSession.getSession();
            session.createCriteria(tipos_carga, RESULT_TYPE.MULTIPLE)
                    .execute();
            session.close();
            
            return tipos_carga.ResultList;
        }
        catch(Exception ex)
        {
            if(session != null)
            {
                session.close();
            }
            return  new ArrayList<Tipos_carga>();
        }
    }
    
    public List<Carrocerias> getCarrocerias()
    {
        Session session = null;
        try
        {
            Carrocerias carrocerias = new Carrocerias();
            session = ConfigureSession.getSession();
            session.createCriteria(carrocerias, RESULT_TYPE.MULTIPLE)
                    .execute();
            session.close();
            
            return carrocerias.ResultList;
        }
        catch(Exception ex)
        {
            if(session != null)
            {
                session.close();
            }
            
            return new ArrayList<Carrocerias>();
        }
    }
    
    public List<Categorias_veiculos> getCategorias()
    {
        Session session = null;
        try
        {
            Categorias_veiculos categorias_veiculos = new Categorias_veiculos();
            
            session = ConfigureSession.getSession();
            session.createCriteria(categorias_veiculos, RESULT_TYPE.MULTIPLE)
                    .execute();
            session.close();
            
            return categorias_veiculos.ResultList;
        }
        catch(Exception ex)
        {
            if(session != null)session.close();
            return new ArrayList<Categorias_veiculos>();
        }
        
    }
   
    @RequestMapping(value = "salvaveiculo", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String salvar(Veiculos v, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            int usuario_id = ((Usuarios) httpSession.getAttribute(("usuarioLogado"))).getId();
            v.setTransportadoras_id(getTransportadora(usuario_id).getId());

            session = ConfigureSession.getSession();
            session.save(v);
            session.commit();
            session.close();
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            System.err.println(ex.getMessage());
            
            return ex.getMessage();
        }
        return "";
    }

    @RequestMapping(value = "alteraveiculo", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String alterar(Veiculos v, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            int usuario_id = ((Usuarios) httpSession.getAttribute(("usuarioLogado"))).getId();
            v.setTransportadoras_id(getTransportadora(usuario_id).getId());

            session = ConfigureSession.getSession();
            session.update(v);
            session.commit();
            session.close();

        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
        }

        return "";
    }

    private Transportadoras getTransportadora(int usuario_id)
    {
        return new TransportadorasController().getByUsuario(usuario_id);
    }
}
