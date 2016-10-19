/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.COMMIT_MODE;
import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Join;
import br.com.persistor.sessionManager.Query;
import br.com.persistor.sessionManager.SessionImpl;
import com.google.gson.Gson;
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Cotacoes;
import entidades.Historico;
import entidades.Tipos_carga;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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

            return session.getList(tipos_carga);
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

            return session.getList(carrocerias);
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

            return session.getList(categorias_veiculos);
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

    @RequestMapping(value = "veiculo_path", produces = "text/html;chatset=utf-8")
    public @ResponseBody
    String getFotoPath(int veiculo_id, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        int tansp_id = new TransportadorasController().getByUsuario(usuario.getId()).getId();
        String retorno = "/mmnfretes/upload/{transp_id}-{veic_id}.jpg";
        retorno = retorno.replace("{transp_id}", tansp_id + "");
        retorno = retorno.replace("{veic_id}", veiculo_id + "");
        return retorno;
    }

    @RequestMapping(value = "infoveiculo", produces = "application/json;charset=utf-8")
    public @ResponseBody
    String getInfoVeiculo(int id, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Veiculos veiculo = new Veiculos();

            session = ConfigureSession.getSession();
            session.onID(veiculo, id);
            session.close();

            Gson gson = new Gson();
            return gson.toJson(veiculo);
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }

            return "";
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

    @RequestMapping("uploadimg")
    public @ResponseBody
    String upload(int veiculo_id, HttpServletRequest request, HttpSession httpSession)
    {
        try
        {
            TransportadorasController tc = new TransportadorasController();
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = tc.getByUsuario(usuario.getId());

            int transportadora_id = transportadora.getId();

            String path = request.getRealPath("/upload");
            path = path.substring(0, path.indexOf("\\build"));
            path += "\\web\\upload\\";

            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
            List<FileItem> items = fileUpload.parseRequest(request);

            for (FileItem item : items)
            {
                if (!item.isFormField())
                {
                    item.write(new File(path + "/" + transportadora_id + "-" + veiculo_id + ".jpg"));
                }
            }

            InputStream foto = items.get(0).getInputStream();
            // String result = gravaImg(transportadora_id, veiculo_id, foto);
            items.get(0).delete();
            return "OK";
        }
        catch (Exception ex)
        {

            return " ERRO " + ex.getMessage();
        }
    }

    private String gravaImg(int transportadoras_id, int veiculos_id, InputStream foto)
    {
        //se o veiculo_id for 0 (zero), pegar a ultima id do veiculo da transportadora
        //se não, atualiza o veiculo da transportadora com o id informado

        Session session = null;
        Veiculos veiculo = null;
        try
        {
            String retorno = "0";
            session = ConfigureSession.getSession();
            if (veiculos_id == 0)
            {
                veiculo = session.Last(Veiculos.class, "transportadoras_id = " + transportadoras_id);
                veiculo.setFoto(foto);
                session.update(veiculo);
                retorno = "1";
            }

            if (veiculos_id > 0)
            {
                veiculo = (Veiculos) session.onID(Veiculos.class, veiculos_id);
                veiculo.setFoto(foto);
                session.update(veiculo);
                retorno = "1";
            }

            session.commit();
            session.close();
            return retorno;
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return "0";
        }
    }

    private boolean podeExcluir(int veiculos_id)
    {
        Session session = null;
        try
        {
            session = ConfigureSession.getSession();

            Historico historico = new Historico();
            Cotacoes cotacoes = new Cotacoes();

            session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "veiculos_id", veiculos_id))
                    .execute();

            session.createCriteria(historico, RESULT_TYPE.MULTIPLE)
                    .add(Restrictions.eq(FILTER_TYPE.WHERE, "veiculos_id", veiculos_id))
                    .execute();

            session.close();
            return (cotacoes.ResultList.isEmpty() || historico.ResultList.isEmpty());
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return false;
        }
    }

    @RequestMapping(value = "excluirveiculo", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String excluiVeiculo(int id, HttpSession httpSession)
    {
        Session session = null;
        try
        {
            Veiculos veiculo = new Veiculos();
            veiculo.setId(id);

            if (!podeExcluir(id))
            {
                return "0";
            }
            session = ConfigureSession.getSession();
            session.delete(veiculo);
            session.commit();
            session.close();

            return "1";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.close();
            }
            return "0";
        }
    }

    @RequestMapping("listarveiculos")
    public ModelAndView listarVeiculos(HttpSession httpSession)
    {
        Veiculos veiculos = new Veiculos();
        Carrocerias carrocerias = new Carrocerias();
        Categorias_veiculos categorias = new Categorias_veiculos();
        Tipos_carga tipos_carga = new Tipos_carga();

        Session session = null;
        try
        {
            TransportadorasController t_controller = new TransportadorasController();
            Transportadoras transportadora = t_controller.getByUsuario(((Usuarios) httpSession.getAttribute("usuarioLogado")).getId());

            session = ConfigureSession.getSession();

            Join join = new Join(veiculos);
            join.addJoin(JOIN_TYPE.INNER, carrocerias, "carrocerias.id = veiculos.carrocerias_id");
            join.addJoin(JOIN_TYPE.INNER, categorias, "categorias_veiculos.id = veiculos.categorias_veiculos_id");
            join.addJoin(JOIN_TYPE.INNER, tipos_carga, "tipos_carga.id = veiculos.tipos_carga_id");
            join.addFinalCondition("where veiculos.transportadoras_id = " + transportadora.getId());
            join.execute(session);

            veiculos.ResultList = join.getList(veiculos);
            List<Veiculos> retorno = new ArrayList<Veiculos>();

            for (Object object : veiculos.ResultList)
            {
                Veiculos vei = (Veiculos) object;

                carrocerias = join.getEntity(Carrocerias.class);
                categorias = join.getEntity(Categorias_veiculos.class);
                tipos_carga = join.getEntity(Tipos_carga.class);

                vei.setCarrocerias(carrocerias);
                vei.setCategorias_veiculos(categorias);
                vei.setTipos_carga(tipos_carga);
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
        Carrocerias carroceria = new Carrocerias();
        Categorias_veiculos categoria = new Categorias_veiculos();
        Tipos_carga tipo_veiculo = new Tipos_carga();

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
            join.addJoin(JOIN_TYPE.INNER, carroceria, "carrocerias.id = veiculos.carrocerias_id");
            join.addJoin(JOIN_TYPE.INNER, categoria, "categorias_veiculos.id = veiculos.categorias_veiculos_id");
            join.addJoin(JOIN_TYPE.INNER, tipo_veiculo, "tipos_carga.id = veiculos.tipos_carga_id");
            join.addFinalCondition(termoBusca);
            join.execute(session);

            veiculos.ResultList = join.getList(veiculos);
            List<Veiculos> retorno = new ArrayList<Veiculos>();

            for (Object object : veiculos.ResultList)
            {
                Veiculos vei = (Veiculos) object;

                carroceria = join.getEntity(Carrocerias.class);
                categoria = join.getEntity(Categorias_veiculos.class);
                tipo_veiculo = join.getEntity(Tipos_carga.class);

                vei.setCarrocerias(carroceria);
                vei.setCategorias_veiculos(categoria);
                vei.setTipos_carga(tipo_veiculo);
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
