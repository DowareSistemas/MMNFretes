/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.generalClasses.FileExtractor;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Join;
import entidades.Avaliacoes;
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Configuracoes;
import entidades.Historico;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import entidadesTemporarias.ResultadoPesquisa;
import enums.Ambientes;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.AmbienteAtual;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class PesquisaFretesController
{

    @RequestMapping("/pesquisafrete")
    public ModelAndView pesquisarFretes(
            @RequestParam(value = "categorias", required = false) String filtro_cat,
            @RequestParam(value = "carrocerias", required = false) String filtro_carroc,
            @RequestParam(value = "rastreador", required = false) boolean rastreador,
            @RequestParam(value = "distancia", required = false) double distancia,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        if (filtro_cat.endsWith(","))
            filtro_cat = filtro_cat.substring(0, (filtro_cat.length() - 1));

        if (filtro_carroc.endsWith(","))
            filtro_carroc = filtro_carroc.substring(0, (filtro_carroc.length() - 1));

        List<ResultadoPesquisa> lista = pesquisar(filtro_cat, filtro_carroc, rastreador, distancia, request, httpSession);

        ModelAndView mav = new ModelAndView("resultadosfretes");
        mav.addObject("resultados", lista);
        return mav;
    }

    private List<Historico> listHistorico(int transportadoras_id)
    {
        Historico historico = new Historico();
        Avaliacoes avaliacoes = new Avaliacoes();

        Session session = null;

        Join join = new Join(historico);
        join.addJoin(JOIN_TYPE.INNER, avaliacoes, "historico.avaliacoes_id = avaliacoes.id");
        join.addFinalCondition(" where historico.transportadoras_id = " + transportadoras_id);

        session = SessionProvider.openSession();
        join.execute(session);
        session.close();

        List<Historico> lista = join.getList(historico);

        for (Historico h : lista)
        {
            avaliacoes = join.getEntity(Avaliacoes.class);
            h.setAvaliacoes(avaliacoes);
        }

        return (lista == null
                ? new ArrayList<Historico>()
                : lista);
    }

    private String getFinalCondition(String filtro_cat, String filtro_carroc, boolean rastreador)
    {
        String finalCondition = " where categorias_veiculos.id in (" + filtro_cat + ") ";
        finalCondition += "and carrocerias.id in (" + filtro_carroc + ") ";
        finalCondition += "and veiculos.rastreador = " + (rastreador == true ? "true" : "false");
        finalCondition += " and veiculos.inativo = false";
        return finalCondition;
    }

    private Join getPreparedJoin(String filtro_cat, String filtro_carroc, boolean rastreador)
    {
        String finalCondition = getFinalCondition(filtro_cat, filtro_carroc, rastreador);

        Transportadoras transportadora = new Transportadoras();
        Veiculos veiculos = new Veiculos();
        Carrocerias carroceria = new Carrocerias();
        Categorias_veiculos categoria_veiculo = new Categorias_veiculos();
        Usuarios usuarios = new Usuarios();

        Join joinVeiculos = new Join(veiculos);
        joinVeiculos.addJoin(JOIN_TYPE.INNER, transportadora, "veiculos.transportadoras_id = transportadoras.id");
        joinVeiculos.addJoin(JOIN_TYPE.INNER, carroceria, "veiculos.carrocerias_id = carrocerias.id");
        joinVeiculos.addJoin(JOIN_TYPE.INNER, categoria_veiculo, "veiculos.categorias_veiculos_id = categorias_veiculos.id");
        joinVeiculos.addJoin(JOIN_TYPE.INNER, usuarios, "transportadoras.usuarios_id = usuarios.id");
        joinVeiculos.addFinalCondition(finalCondition);

        Session session = SessionProvider.openSession();
        joinVeiculos.execute(session);
        session.close();

        return joinVeiculos;
    }

    private int getEstrelas(int transportadora_id)
    {
        int total_avaliacoes = 0;
        int total_estrelas = 0;
        List<Historico> historicos = listHistorico(transportadora_id);

        for (Historico historico : historicos)
        {
            Avaliacoes a = historico.getAvaliacoes();
            total_estrelas += a.getEstrelas();
            total_avaliacoes++;
        }

        int estrelas = 0;
        if (total_estrelas > 0 && total_avaliacoes > 0)
            estrelas = (total_estrelas / total_avaliacoes);

        return estrelas;
    }

    private List<ResultadoPesquisa> pesquisar(
            String filtro_cat,
            String filtro_carroc,
            boolean rastreador,
            double distancia,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        Veiculos veiculos = new Veiculos();
        Join joinVeiculos = getPreparedJoin(filtro_cat, filtro_carroc, rastreador);

        List<ResultadoPesquisa> resultados = new ArrayList<ResultadoPesquisa>();
        List<Veiculos> listaVeiculos = joinVeiculos.getList(veiculos);

        for (Veiculos veiculo : listaVeiculos)
        {
            if (new CotacoesController().existeCotacaoComVeiculo(veiculo.getId(), httpSession))
                continue;

            veiculo.setCarrocerias((Carrocerias) joinVeiculos.getEntity(Carrocerias.class));
            veiculo.setCategorias_veiculos((Categorias_veiculos) joinVeiculos.getEntity(Categorias_veiculos.class));

            Transportadoras transp = (Transportadoras) joinVeiculos.getEntity(Transportadoras.class);
            transp.setUsuarios((Usuarios) joinVeiculos.getEntity(Usuarios.class));
            veiculo.setTransportadoras(transp);

            double preco_frete = (veiculo.getPreco_frete() * distancia);
            int estrelas = getEstrelas(veiculo.getTransportadoras_id());
            String foto_path = getFotoPath(veiculo, request);

            ResultadoPesquisa resultado = new ResultadoPesquisa(veiculo, estrelas, preco_frete, foto_path);
            resultados.add(resultado);
        }
        return resultados;
    }

    private String getFotoPath(Veiculos veiculo, HttpServletRequest request)
    {
        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("foto_path");
            String path = config.getValor();

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
                            : PesquisaFretesController.getUrlAcessoImagens() + fileName);
                }
        }
        catch (Exception ex)
        {
            // PersistenceLoggerImpl log = new PersistenceLoggerImpl();
            // log.newNofication(new PersistenceLog(getClass().getName(), "String getFotoPath(Veiculos veiculo, HttpServletRequest request)", null, ex, ""));
        }

        return "not_localized";
    }

    private String getFileName(Veiculos veiculo)
    {
        Calendar c = Calendar.getInstance();
        String name = (veiculo.getId() + veiculo.getDescricao() + veiculo.getTransportadoras().getId());
        return name + ".jpg";
    }

    public static String getUrlAcessoImagens()
    {
        switch (AmbienteAtual.getAmbienteAtual())
        {
            case Ambientes.PRODUCAO:
                return "/gcfretes/upload/";
            case Ambientes.SIMULA_OFFLINE:
                return "/gcfretes/upload/";
            case Ambientes.SIMULA_ONLINE:
                return "/simula_gcfretes/upload/";
        }
        
        return "";
    }
}
