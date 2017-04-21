/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.FileExtractor;
import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.generalClasses.Util;
import br.com.persistor.interfaces.ICriteria;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Configuracoes;
import entidades.Produtos;
import entidades.Usuarios;
import entidadesTemporarias.ProdutosImgCache;
import entidadesTemporarias.ResultadoListaProduto;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import logging.PersistenceLoggerImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.annotation.Scope;
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
@Scope(value = "request")
public class RepresetacoesController
{

    @RequestMapping(value = "/representacoes")
    public ModelAndView redirect()
    {
        ModelAndView mav = new ModelAndView("representacoes");
        mav.addObject("resultados", listar());

        return mav;
    }

    private List<ResultadoListaProduto> listar()
    {
        Produtos produtos = new Produtos();
        List<ResultadoListaProduto> resultado = new ArrayList<ResultadoListaProduto>();

        Session session = SessionProvider.openSession();
        session.createCriteria(produtos, RESULT_TYPE.MULTIPLE).execute();
        session.close();

        List<Produtos> listProds = produtos.toList();
        for (Produtos produto : listProds)
            resultado.add(new ResultadoListaProduto(produto, getFoto_path(produto)));

        return resultado;
    }

    @RequestMapping(value = "listaProdutosUsuario", method = RequestMethod.POST)
    public ModelAndView
            listaProdutosUsuario(HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");

        ModelAndView mav = new ModelAndView("produtos-usuarios");
        Produtos produtos = new Produtos();

        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(produtos, RESULT_TYPE.MULTIPLE);
        c.setSpecificFields("id", "nome", "descricao", "tipo", "preco", "usuario_id", "unidade");
        c.add(Restrictions.eq(FILTER_TYPE.WHERE, "usuario_id", usuarioLogado.getId()));
        c.execute();
        session.close();

        mav.addObject("resultados", produtos.toList());
        return mav;
    }

    @RequestMapping(value = "findProduto", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody
    String findProduto(@RequestParam(value = "produto_id") int id)
    {
        Produtos produto = get(id, false);

        Produtos result = new Produtos();
        result.setId(produto.getId());
        result.setNome(produto.getNome());
        result.setDescricao(produto.getDescricao());
        result.setPreco(produto.getPreco());
        result.setUsuario_id(produto.getUsuario_id());
        result.setTipo(produto.getTipo());
        result.setUnidade(produto.getUnidade());

        return new Gson().toJson(result);
    }

    public Produtos get(int id, boolean comImagem)
    {
        Produtos produtoCache = ProdutosImgCache.getInstance().find(id);
        if (produtoCache != null)
        {
            if (comImagem)
            {
                if (produtoCache.getFoto() == null)
                    return getFromDatabase(id, true);
            }

            if (!comImagem)
                return produtoCache;
        }

        //produto nao está no cache, buscando no banco
        return getFromDatabase(id, comImagem);
    }

    private Produtos getFromDatabase(int id, boolean comFoto)
    {
        Produtos produto = new Produtos();
        Session session = SessionProvider.openSession();
        ICriteria c = session.createCriteria(produto, RESULT_TYPE.UNIQUE);

        if (comFoto == false)
            c.setSpecificFields("id", "nome", "descricao", "tipo", "preco", "usuario_id", "unidade");

        c.add(Restrictions.eq(FILTER_TYPE.WHERE, "id", id));
        c.execute();

        session.close();

        if (ProdutosImgCache.getInstance().find(id) == null)
            ProdutosImgCache.getInstance().add(produto);
        else
            ProdutosImgCache.getInstance().update(produto);

        return produto;
    }

    @RequestMapping(value = "produto_path", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String getFotoPath(@RequestParam(value = "produto_id") int produto_id, HttpServletRequest request)
    {
        IPersistenceLogger logger = new PersistenceLoggerImpl();
        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("foto_path");
            String path = config.getValor();
            Produtos produto = get(produto_id, true);

            if (produto.getId() > 0)
            {
                if (produto.getFoto() != null)
                {
                    String fileName = getFileName(produto);
                    String imageFile = (path + fileName);
                    FileExtractor extractor = new FileExtractor();
                    extractor.setBufferSize(1024);
                    extractor.setInputStream(produto.getFoto());
                    extractor.setFileToExtract(imageFile);
                    extractor.extract();

                    // BufferedImage image = ImageIO.read(new File(imageFile));
                    return (PesquisaFretesController.getUrlAcessoImagens() + fileName);
                }
            }

        }
        catch (Exception ex)
        {
            logger.newNofication(new PersistenceLog("RepresentacoesController",
                    "getFotoPath",
                    Util.getDateTime(),
                    Util.getFullStackTrace(ex), ""));
        }

        return "not_localized";
    }

    private String getFoto_path(Produtos produto)
    {
        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("foto_path");
            String path = config.getValor();

            if (produto.getId() > 0)
            {
                if (produto.getFoto() != null)
                {
                    String fileName = getFileName(produto);
                    String imageFile = (path + fileName);

                    FileExtractor extractor = new FileExtractor();
                    extractor.setBufferSize(1024);
                    extractor.setInputStream(produto.getFoto());
                    extractor.setFileToExtract(imageFile);
                    extractor.extract();

                    BufferedImage image = ImageIO.read(new File(imageFile));

                    return (image == null
                            ? "not_localized"
                            : PesquisaFretesController.getUrlAcessoImagens() + fileName);
                }
            }
        }
        catch (Exception ex)
        {

        }

        return "not_localized";
    }

    private String getFileName(Produtos produto)
    {
        String name = "prod" + produto.getId() + produto.getUsuario_id() + ".jpg";
        return name;
    }

    @RequestMapping(value = "/salva-produto", method = RequestMethod.POST)
    public @ResponseBody
    String salvaProduto(Produtos produto, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        produto.setUsuario_id(usuario.getId());

        Session session = SessionProvider.openSession();

        if (session.count(Produtos.class, "id = " + produto.getId()) == 0)
            session.save(produto);
        else
        {
            Produtos prodDB = get(produto.getId(), true);
            produto.setFoto(prodDB.getFoto());
            session.update(produto);
        }

        session.commit();
        session.close();

        if (produto.saved || produto.updated)
        {
            if (ProdutosImgCache.getInstance().find(produto.getId()) == null)
                ProdutosImgCache.getInstance().add(produto);
            else
                ProdutosImgCache.getInstance().update(produto);
            return produto.getId() + "";
        }
        return "0";
    }

    @RequestMapping(value = "/upload-img-produto", method = RequestMethod.POST)
    public @ResponseBody
    String uploadImg(int produto_id, HttpServletRequest request, HttpSession httpSession)
    {
        InputStream inputStream = null;
        try
        {
            Session session = SessionProvider.openSession();
            Produtos produto = session.onID(Produtos.class, produto_id);

            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
            List<FileItem> items = fileUpload.parseRequest(request);
            if (items.isEmpty())
                return "0";

            inputStream = items.get(0).getInputStream();
            produto.setFoto(inputStream);

            ProdutosImgCache.getInstance().update(produto);

            session.update(produto);
            session.commit();
            session.close();
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

    private void closeIS(InputStream is)
    {
        try
        {
            is.close();
        }
        catch (Exception ex)
        {

        }
    }
}
