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
import entidades.Historico;
import entidades.Transportadoras;
import entidades.Veiculos;
import entidadesTemporarias.ResultadoPesquisa;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class PesquisaFretesController
{

    @RequestMapping("/pesquisafrete")
    public ModelAndView pesquisarFretes(
            @RequestParam(value = "categorias", required = false) String filtro_cat,
            @RequestParam(value = "carrocerias", required = false) String filtro_carroc,
            @RequestParam(value = "rastreador", required = false) boolean rastreador,
            @RequestParam(value = "distancia", required = false) double distancia,
            HttpServletRequest request)
    {
        if (filtro_cat.endsWith(","))
            filtro_cat = filtro_cat.substring(0, (filtro_cat.length() - 1));

        if (filtro_carroc.endsWith(","))
            filtro_carroc = filtro_carroc.substring(0, (filtro_carroc.length() - 1));

        List<ResultadoPesquisa> lista = pesquisar(filtro_cat, filtro_carroc, rastreador, distancia, request);

        ModelAndView mav = new ModelAndView("pesquisarfretes");
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

    private List<ResultadoPesquisa> pesquisar(
            String filtro_cat,
            String filtro_carroc,
            boolean rastreador,
            double distancia,
            HttpServletRequest request)
    {
        List<ResultadoPesquisa> resultados = new ArrayList<ResultadoPesquisa>();

        String finalCondition = " where categorias_veiculos.id in (" + filtro_cat + ") ";
        finalCondition += "and carrocerias.id in (" + filtro_carroc + ") ";
        finalCondition += "and veiculos.rastreador = " + (rastreador == true ? "1" : "0");

        Transportadoras transportadora = new Transportadoras();
        Veiculos veiculos = new Veiculos();
        Carrocerias carroceria = new Carrocerias();
        Categorias_veiculos categoria_veiculo = new Categorias_veiculos();

        Join joinVeiculos = new Join(veiculos);
        joinVeiculos.addJoin(JOIN_TYPE.INNER, transportadora, "veiculos.transportadoras_id = transportadoras.id");
        joinVeiculos.addJoin(JOIN_TYPE.INNER, carroceria, "veiculos.carrocerias_id	 = carrocerias.id");
        joinVeiculos.addJoin(JOIN_TYPE.INNER, categoria_veiculo, "veiculos.categorias_veiculos_id = categorias_veiculos.id");
        joinVeiculos.addFinalCondition(finalCondition);

        Session session = SessionProvider.openSession();
        joinVeiculos.execute(session);
        session.close();

        List<Veiculos> listaVeiculos = joinVeiculos.getList(veiculos);

        for (Veiculos veiculo : listaVeiculos)
        {
            carroceria = joinVeiculos.getEntity(Carrocerias.class);
            categoria_veiculo = joinVeiculos.getEntity(Categorias_veiculos.class);
            transportadora = joinVeiculos.getEntity(Transportadoras.class);

            veiculo.setCarrocerias(carroceria);
            veiculo.setCategorias_veiculos(categoria_veiculo);
            veiculo.setTransportadoras(transportadora);

            double preco_frete = (veiculo.getPreco_frete() * distancia);
            int total_avaliacoes = 0;
            int total_estrelas = 0;
            List<Historico> historicos = listHistorico(transportadora.getId());

            for (Historico historico : historicos)
            {
                Avaliacoes a = historico.getAvaliacoes();
                total_estrelas += a.getEstrelas();
                total_avaliacoes++;
            }

            int estrelas = 0;
            if (total_estrelas > 0 && total_avaliacoes > 0)
                estrelas = (total_estrelas / total_avaliacoes);

            String foto_path = getFotoPath(veiculo, request);

            ResultadoPesquisa resultado = new ResultadoPesquisa(veiculo, estrelas, preco_frete, foto_path);
            resultados.add(resultado);
        }
        return resultados;
    }

    private String getFotoPath(Veiculos veiculo, HttpServletRequest request)
    {
        ServletContext context = request.getServletContext();
        String path = context.getRealPath("/upload");
        path = path.substring(0, path.indexOf("\\build"));
        path += "\\web\\upload\\";

        if (veiculo.getId() > 0)
            if (veiculo.getFoto() != null)
            {
                String fileName = getFileName(veiculo);
                FileExtractor extractor = new FileExtractor();
                extractor.setBufferSize(1024);
                extractor.setInputStream(veiculo.getFoto());
                extractor.setFileToExtract(path + fileName);
                extractor.extract();

                return "/mmnfretes/upload/" + fileName;
            }

        return "not_localized";
    }

    private String getFileName(Veiculos veiculo)
    {
        Calendar c = Calendar.getInstance();
        String name = (veiculo.getId() + veiculo.getDescricao() + veiculo.getTransportadoras().getId());
        return name + ".jpg";
    }
}
