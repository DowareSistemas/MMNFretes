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
import br.com.persistor.interfaces.ICriteria;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Configuracoes;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import logging.PersistenceLoggerImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;
import org.springframework.web.servlet.ModelAndView;
import util.Tipo_carga;
import util.Util;

/**
 *
 * @author emers
 */
@Controller
public class TransportadorasController
{
    @RequestMapping("lancamentos")
    public String redirectLancamentos()
    {
        return "lancamentos";
    }

    @RequestMapping("uploadimgperfil")
    public @ResponseBody
    String upLoad(HttpSession httpSession, HttpServletRequest request)
    {
        InputStream inputStream = null;
        try
        {
            TransportadorasController tc = new TransportadorasController();
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = tc.getByUsuario(usuario.getId());

            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
            List<FileItem> items = fileUpload.parseRequest(request);

            if (items.isEmpty())
                return "0";
            if (items.get(0) == null)
                return "0";
            if (items.get(0).getInputStream() == null)
                return "0";

            inputStream = items.get(0).getInputStream();
            transportadora.setFoto_logo(inputStream);
            alteraInfoTransportadora(transportadora, httpSession);
            inputStream.close();

        }
        catch (FileUploadException ex)
        {
            ex.printStackTrace();
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
        return "";
    }

    @RequestMapping("/areatransportador")
    public ModelAndView redireciona(HttpSession session)
    {
        Usuarios usuario = (Usuarios) session.getAttribute("usuarioLogado");

        if (!Util.isUsuario(usuario))
        {
            List<Tipo_carga> tipos_carga = new ArrayList<Tipo_carga>();
            tipos_carga.add(new Tipo_carga(1, "Kilos"));
            tipos_carga.add(new Tipo_carga(2, "Toneladas"));
            tipos_carga.add(new Tipo_carga(3, "Passageiros"));

            VeiculosController veiculosController = new VeiculosController();

            ModelAndView modelAndView = new ModelAndView("areatransportador");
            modelAndView.addObject("tipos_carga", tipos_carga);
            modelAndView.addObject("categorias_veiculos", veiculosController.getCategorias());
            modelAndView.addObject("carrocerias", veiculosController.getCarrocerias());
            return modelAndView;
        }
        else
            return new ModelAndView("");
    }

    @RequestMapping(value = "/infoTransportador", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String getInfo(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario.getId()))
                .execute();
        session.close();

        Gson gson = new Gson();
        return gson.toJson(transportadora);
    }

    @RequestMapping(value = "/foto_transportador")
    public @ResponseBody
    String getFotoLogo(HttpSession httpSession)
    {
        IPersistenceLogger logger = new PersistenceLoggerImpl();
        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("foto_path");
            String path = config.getValor();

            Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transp = getTransportadora(usuarioLogado.getId());

            if (transp.getId() > 0)
                if (transp.getFoto_logo() != null)
                {
                    String fileName = getFileName(transp);
                    String imageFile = (path + fileName);
                    FileExtractor extractor = new FileExtractor();
                    extractor.setBufferSize(1024);
                    extractor.setInputStream(transp.getFoto_logo());
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
                    br.com.persistor.generalClasses.Util.getDateTime(),
                    br.com.persistor.generalClasses.Util.getFullStackTrace(ex), ""));
        }
        return "not_localized";
    }

    private String getFileName(Transportadoras t)
    {
        String name = (t.getId() + "" + t.getNome());
        return name + ".jpg";
    }

    @RequestMapping("/alteraInfoTransportadora")
    public @ResponseBody
    String alteraInfoTransportadora(Transportadoras transportadora, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        int idTransportadora = getIdTransportadora(usuarioLogado.getId());

        transportadora.getUsuarios().setId(usuarioLogado.getId());
        transportadora.getUsuarios().setTipo_usuario(usuarioLogado.getTipo_usuario());
        transportadora.setNome(transportadora.getUsuarios().getNome());
        transportadora.setId(idTransportadora);

        Session session = SessionProvider.openSession();

        if(transportadora.getFoto_logo() == null)
        {
            Transportadoras t = session.onID(Transportadoras.class, idTransportadora);
            transportadora.setFoto_logo(t.getFoto_logo());
        }
        
        session.update(transportadora);
        session.commit();
        session.close();

        return "OK";
    }

    @RequestMapping("/alteraStatusPagSeguro")
    public @ResponseBody
    String alteraBoleto(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Session session = null;

        try
        {
            Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
            Transportadoras transportadora = getTransportadora(usuario.getId());
            transportadora.setPag_seguro(status);

            session = SessionProvider.openSession();
            session.update(transportadora);
            session.commit();
            session.close();
            return "OK";

        }
        catch (Exception ex)
        {
            if (session != null)
                session.close();
            return "ERRO";
        }
    }

    @RequestMapping("/alteraStatusNegociacao")
    public @ResponseBody
    String alteraNegociacao(@PathParam(value = "status") boolean status, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Transportadoras transportadora = getTransportadora(usuario.getId());
        transportadora.setNegociacao_direta(status);

        Session session = SessionProvider.openSession();
        session.update(transportadora);
        session.commit();
        session.close();
        return "OK";
    }

    private Transportadoras getTransportadora(int idUsuario)
    {
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();
        session.close();

        return transportadora;
    }

    public Transportadoras getByUsuario(int usuario_id)
    {
        Transportadoras transportadora = new Transportadoras();
        Usuarios usuario = new Usuarios();

        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(JOIN_TYPE.INNER, usuario, "transportadoras.usuarios_id = usuarios.id")
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "transportadoras.usuarios_id", usuario_id))
                .execute();

        usuario = (Usuarios) c.loadEntity(usuario);
        transportadora = (Transportadoras) c.loadEntity(transportadora);
        session.close();

        transportadora.setUsuarios(usuario);
        return transportadora;
    }

    public Transportadoras find(int id)
    {
        Session session = SessionProvider.openSession();
        Transportadoras t = session.onID(Transportadoras.class, id);
        session.close();

        return t;
    }

    private int getIdTransportadora(int idUsuario)
    {
        Transportadoras transportadora = new Transportadoras();

        Session session = SessionProvider.openSession();
        session.createCriteria(transportadora, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", idUsuario))
                .execute();
        session.close();

        return transportadora.getId();
    }
}
