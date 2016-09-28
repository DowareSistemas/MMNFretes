/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.interfaces.Session;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
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

    @RequestMapping(value = "salvaveiculo", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String salvar(Veiculos v, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            int usuario_id = ((Usuarios) httpSession.getAttribute(("usuarioLogado"))).getId();
            v.setTransportadoras_id(get(usuario_id).getId());

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
            v.setTransportadoras_id(get(usuario_id).getId());

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

    private Transportadoras get(int usuario_id)
    {
        return new TransportadorasController().getByUsuario(usuario_id);
    }
}
