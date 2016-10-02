/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Join;
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
import org.springframework.web.servlet.ModelAndView;
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
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return new ArrayList<Tipos_carga>();
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
        catch (Exception ex)
        {
            if (session != null)
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
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
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

    public List<Veiculos> listaVeiculos = new ArrayList<Veiculos>();

    @RequestMapping("listarveiculos")
    public ModelAndView listarVeiculos(HttpSession httpSession)
    {
        Veiculos veiculos = new Veiculos();
        Carrocerias carrocerias = new Carrocerias();
        Categorias_veiculos cat = new Categorias_veiculos();
        Tipos_carga tipos = new Tipos_carga();

        Session session = null;
        try
        {
            TransportadorasController t_controller = new TransportadorasController();
            Transportadoras transportadora = t_controller.getByUsuario(((Usuarios) httpSession.getAttribute("usuarioLogado")).getId());

            session = ConfigureSession.getSession();

            Join join = new Join(veiculos);
            join.addJoin(JOIN_TYPE.INNER, carrocerias, "carrocerias.id = veiculos.carrocerias_id");
            join.addJoin(JOIN_TYPE.INNER, cat, "categorias_veiculos.id = veiculos.categorias_veiculos_id");
            join.addJoin(JOIN_TYPE.INNER, tipos, "tipos_carga.id = veiculos.tipos_carga_id");
            join.addFinalCondition("where veiculos.transportadoras_id = " + transportadora.getId());
            join.execute(session);

            veiculos.ResultList = join.getList(veiculos);
            List<Veiculos> retorno = new ArrayList<Veiculos>();

            for (Object object : veiculos.ResultList)
            {
                Veiculos vei = (Veiculos) object;

                carrocerias = new Carrocerias();
                cat = new Categorias_veiculos();
                tipos = new Tipos_carga();

                join.getResultObj(carrocerias);
                join.getResultObj(cat);
                join.getResultObj(tipos);

                vei.setCarrocerias(carrocerias);
                vei.setCategorias_veiculos(cat);
                vei.setTipos_carga(tipos);
                retorno.add(vei);
            }
            session.close();

            ModelAndView mav = new ModelAndView("listaveiculos");
            mav.addObject("veiculos", retorno);

            return mav;
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
        }

        ModelAndView mav = new ModelAndView("listaenderecos");
        mav.addObject("veiculos", new ArrayList<Veiculos>());
        return mav;
    }

    @RequestMapping("buscarveiculos")
    public ModelAndView buscarVeiculos(String nome, HttpSession httpSession)
    {
        nome = nome.replace("'", "");
        Veiculos veiculos = new Veiculos();
        Carrocerias carrocerias = new Carrocerias();
        Categorias_veiculos cat = new Categorias_veiculos();
        Tipos_carga tipos = new Tipos_carga();

        Session session = null;
        try
        {
            TransportadorasController t_controller = new TransportadorasController();
            Transportadoras transportadora = t_controller.getByUsuario(((Usuarios) httpSession.getAttribute("usuarioLogado")).getId());

            String termoBusca = "where veiculos.transportadoras_id = " + transportadora.getId();
            termoBusca += " AND veiculos.descricao LIKE '%" + nome + "%'";
            termoBusca += " or categorias_veiculos.descricao like '%" + nome + "%'";
            termoBusca += " or carrocerias.descricao like '%" + nome + "%'";
            
            session = ConfigureSession.getSession();

            Join join = new Join(veiculos);
            join.addJoin(JOIN_TYPE.INNER, carrocerias, "carrocerias.id = veiculos.carrocerias_id");
            join.addJoin(JOIN_TYPE.INNER, cat, "categorias_veiculos.id = veiculos.categorias_veiculos_id");
            join.addJoin(JOIN_TYPE.INNER, tipos, "tipos_carga.id = veiculos.tipos_carga_id");
            join.addFinalCondition(termoBusca);
            join.execute(session);

            veiculos.ResultList = join.getList(veiculos);
            List<Veiculos> retorno = new ArrayList<Veiculos>();

            for (Object object : veiculos.ResultList)
            {
                Veiculos vei = (Veiculos) object;

                carrocerias = new Carrocerias();
                cat = new Categorias_veiculos();
                tipos = new Tipos_carga();

                join.getResultObj(carrocerias);
                join.getResultObj(cat);
                join.getResultObj(tipos);

                vei.setCarrocerias(carrocerias);
                vei.setCategorias_veiculos(cat);
                vei.setTipos_carga(tipos);
                retorno.add(vei);
            }
            session.close();

            ModelAndView mav = new ModelAndView("listaveiculos");
            mav.addObject("veiculos", retorno);

            return mav;
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }

            System.err.println(ex.getMessage());
        }

        ModelAndView mav = new ModelAndView("listaenderecos");
        mav.addObject("veiculos", new ArrayList<Veiculos>());
        return mav;
    }

    private Transportadoras getTransportadora(int usuario_id)
    {
        return new TransportadorasController().getByUsuario(usuario_id);
    }
}
