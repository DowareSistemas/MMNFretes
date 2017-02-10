/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.FileExtractor;
import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.generalClasses.Util;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Criteria;
import br.com.persistor.sessionManager.Join;
import com.google.gson.Gson;
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Configuracoes;
import entidades.Cotacoes;
import entidades.Historico;
import entidades.Tipos_carga;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import logging.PersistenceLoggerImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

/**
 *
 * @author marcosvinicius
 */
@Controller
public class VeiculosController
{

    public List<Tipos_carga> getTipos_Carga()
    {
        Tipos_carga tipos_carga = new Tipos_carga();
        Session session = SessionProvider.openSession();
        session.createCriteria(tipos_carga, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();
        return session.getList(tipos_carga);
    }

    public List<Carrocerias> getCarrocerias()
    {
        Carrocerias carrocerias = new Carrocerias();
        Session session = SessionProvider.openSession();
        session.createCriteria(carrocerias, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();
        return session.getList(carrocerias);
    }

    public List<Categorias_veiculos> getCategorias()
    {
        Categorias_veiculos categorias_veiculos = new Categorias_veiculos();
        Session session = SessionProvider.openSession();
        session.createCriteria(categorias_veiculos, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();
        return session.getList(categorias_veiculos);
    }

    @RequestMapping(value = "veiculo_path", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String getFotoPath(@RequestParam(value = "veiculo_id") int veiculo_id, HttpServletRequest request)
    {
        IPersistenceLogger logger = new PersistenceLoggerImpl();
        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("foto_path");
            String path = config.getValor();

            Veiculos veiculo = get(veiculo_id);

            if (veiculo.getId() > 0)
                if (veiculo.getFoto() != null)
                {
                    String fileName = getFileName(veiculo);
                    String imageFile = (path + fileName);
                    FileExtractor extractor = new FileExtractor();
                    extractor.setBufferSize(1024);
                    extractor.setInputStream(veiculo.getFoto());
                    extractor.setFileToExtract(imageFile);
                    extractor.extract();

                    BufferedImage image = ImageIO.read(new File(imageFile));

                    return (image == null
                            ? "not_localized"
                            : "/gcfretes/upload/" + fileName);
                }
        }
        catch (Exception ex)
        {
            logger.newNofication(new PersistenceLog("VeiculosController",
                    "getFotoPath",
                    Util.getDateTime(),
                    Util.getFullStackTrace(ex), ""));
        }
        return "not_localized";
    }

    private String getFileName(Veiculos veiculo)
    {
        String name = (veiculo.getId() + "" + veiculo.getCarrocerias_id() + "" + veiculo.getCategorias_veiculos_id() + "" + veiculo.getTransportadoras().getId());
        return name + ".jpg";
    }

    private Veiculos get(int veiculo_id)
    {
        Veiculos veiculo = new Veiculos();
        Session session = SessionProvider.openSession();
        session.onID(veiculo, veiculo_id);
        session.close();
        return veiculo;
    }

    @RequestMapping(value = "infoveiculo", produces = "application/json;charset=utf-8")
    public @ResponseBody
    String getInfoVeiculo(int id, HttpSession httpSession)
    {
        Session session = SessionProvider.openSession();
        Veiculos veiculo = session.onID(Veiculos.class, id);
        session.close();

        Gson gson = new Gson();
        return gson.toJson(veiculo);
    }

    @RequestMapping(value = "salvaveiculo", method = RequestMethod.POST)
    public @ResponseBody
    String salvar(Veiculos veiculo, HttpSession httpSession)
    {
        int usuario_id = ((Usuarios) httpSession.getAttribute(("usuarioLogado"))).getId();
        veiculo.setTransportadoras_id(getTransportadora(usuario_id).getId());

        Session session = SessionProvider.openSession();
        session.save(veiculo);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping(value = "alteraveiculo", method = RequestMethod.POST)
    public @ResponseBody
    String alterar(Veiculos veiculo, HttpSession httpSession)
    {
        int usuario_id = ((Usuarios) httpSession.getAttribute(("usuarioLogado"))).getId();
        veiculo.setTransportadoras_id(getTransportadora(usuario_id).getId());

        Session session = SessionProvider.openSession();

        if (veiculo.getFoto() == null)
        {
            Veiculos v = session.onID(Veiculos.class, veiculo.getId());
            veiculo.setFoto(v.getFoto());
        }

        session.update(veiculo);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping("uploadimg")
    public @ResponseBody
    String upload(int veiculo_id, HttpServletRequest request, HttpSession httpSession)
    {
        InputStream inputStream = null;
        try
        {
            TransportadorasController tc = new TransportadorasController();
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = tc.getByUsuario(usuario.getId());

            int transportadora_id = transportadora.getId();

            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
            List<FileItem> items = fileUpload.parseRequest(request);
            if (items.isEmpty())
                return "0";

            inputStream = items.get(0).getInputStream();
            gravaImg(transportadora_id, veiculo_id, inputStream);
            inputStream.close();

            return "OK";
        }
        catch (FileUploadException ex)
        {
            if (inputStream != null)
                closeIS(inputStream);
            return " ERRO " + ex.getMessage();
        }
        catch (IOException ex)
        {
            if (inputStream != null)
                closeIS(inputStream);
            return " ERRO " + ex.getMessage();
        }
    }

    private void closeIS(InputStream inputStream)
    {
        try
        {
            inputStream.close();
        }
        catch (Exception ex)
        {

        }
    }

    private String gravaImg(int transportadoras_id, int veiculos_id, InputStream foto)
    {
        //se o veiculo_id for 0 (zero), pegar a ultima id do veiculo da transportadora
        //se não, atualiza o veiculo da transportadora com o id informado

        Veiculos veiculo;

        String retorno = "0";
        Session session = SessionProvider.openSession();

        if (veiculos_id == 0)
        {
            veiculo = session.last(Veiculos.class, "transportadoras_id = " + transportadoras_id);
            veiculo.setFoto(foto);
            session.update(veiculo);
            retorno = "1";

        }

        if (veiculos_id > 0)
        {
            veiculo = session.onID(Veiculos.class, veiculos_id);
            veiculo.setFoto(foto);
            session.update(veiculo);
            retorno = "1";
        }

        session.commit();
        session.close();
        return retorno;
    }

    private boolean podeExcluir(int veiculos_id)
    {
        Historico historico = new Historico();
        Cotacoes cotacoes = new Cotacoes();

        Session session = SessionProvider.openSession();

        session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "veiculos_id", veiculos_id))
                .execute();

        session.createCriteria(historico, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "veiculos_id", veiculos_id))
                .execute();

        session.close();

        return (cotacoes.ResultList.isEmpty() && historico.ResultList.isEmpty());
    }

    @RequestMapping(value = "excluirveiculo", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String excluiVeiculo(int id, HttpSession httpSession)
    {
        Veiculos veiculo = new Veiculos();
        veiculo.setId(id);

        if (!podeExcluir(id))
            return "0";

        Session session = SessionProvider.openSession();
        session.delete(veiculo);
        session.commit();
        session.close();

        return "1";
    }

    @RequestMapping("listarveiculos")
    public ModelAndView listarVeiculos(HttpSession httpSession)
    {
        Veiculos veiculos = new Veiculos();
        Carrocerias carrocerias = new Carrocerias();
        Categorias_veiculos categorias = new Categorias_veiculos();
        Tipos_carga tipos_carga = new Tipos_carga();

        TransportadorasController t_controller = new TransportadorasController();
        Transportadoras transportadora = t_controller.getByUsuario(((Usuarios) httpSession.getAttribute("usuarioLogado")).getId());

        Session session = SessionProvider.openSession();
        Criteria criteria = session.createCriteria(veiculos, RESULT_TYPE.MULTIPLE);
        criteria.add(JOIN_TYPE.INNER, carrocerias, "carrocerias.id = veiculos.carrocerias_id");
        criteria.add(JOIN_TYPE.INNER, categorias, "categorias_veiculos.id = veiculos.categorias_veiculos_id");
        criteria.add(JOIN_TYPE.INNER, tipos_carga, "tipos_carga.id = veiculos.tipos_carga_id");
        criteria.add(Restrictions.eq(FILTER_TYPE.WHERE, "veiculos.transportadoras_id ", transportadora.getId()));
        criteria.execute();
        session.close();

        List<Veiculos> listVeiculos = criteria.loadList(veiculos);
        List<Veiculos> retorno = new ArrayList<Veiculos>();

        for (Veiculos vei : listVeiculos)
        {
            vei.setCarrocerias((Carrocerias) criteria.loadEntity(carrocerias));
            vei.setCategorias_veiculos((Categorias_veiculos) criteria.loadEntity(categorias));
            vei.setTipos_carga((Tipos_carga) criteria.loadEntity(tipos_carga));
            retorno.add(vei);
        }

        ModelAndView mav = new ModelAndView("listaveiculos");
        mav.addObject("veiculos", retorno);
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

        TransportadorasController t_controller = new TransportadorasController();
        Transportadoras transportadora = t_controller.getByUsuario(((Usuarios) httpSession.getAttribute("usuarioLogado")).getId());

        String termoBusca = "where veiculos.transportadoras_id = " + transportadora.getId();
        termoBusca += " AND (veiculos.descricao LIKE '%" + nome + "%'";
        termoBusca += " or categorias_veiculos.descricao like '%" + nome + "%'";
        termoBusca += " or carrocerias.descricao like '%" + nome + "%')";

        Session session = SessionProvider.openSession();

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

            vei.setCarrocerias((Carrocerias) join.getEntity(Carrocerias.class));
            vei.setCategorias_veiculos((Categorias_veiculos) join.getEntity(Categorias_veiculos.class));
            vei.setTipos_carga((Tipos_carga) join.getEntity(Tipos_carga.class));
            retorno.add(vei);
        }
        session.close();

        ModelAndView mav = new ModelAndView("listaveiculos");
        mav.addObject("veiculos", retorno);

        return mav;

    }

    private Transportadoras getTransportadora(int usuario_id)
    {
        return new TransportadorasController().getByUsuario(usuario_id);
    }

    public List<Veiculos> getList(HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras t = getTransportadora(usuarioLogado.getId());
        Veiculos v = new Veiculos();
        
        Session session = SessionProvider.openSession();
        session.createCriteria(v, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "transportadoras_id", t.getId()))
                .execute();
        session.close();
        
        return session.getList(v);
    }
}
