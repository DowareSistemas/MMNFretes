/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.FileExtractor;
import br.com.persistor.interfaces.Session;
import entidades.Configuracoes;
import entidades.Produtos;
import entidades.Usuarios;
import entidadesTemporarias.ResultadoListaProduto;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        Calendar c = Calendar.getInstance();
        String name = "prod" + produto.getId() + produto.getUsuario_id();
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
            session.update(produto);

        session.commit();
        session.close();

        return (produto.saved || produto.updated
                ? produto.getId() + ""
                : "0");
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
