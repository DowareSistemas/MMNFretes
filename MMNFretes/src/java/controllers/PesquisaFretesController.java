/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Join;
import entidades.Avaliacoes;
import entidades.Carrocerias;
import entidades.Categorias_veiculos;
import entidades.Historico;
import entidades.Transportadoras;
import entidades.Veiculos;
import entidadesTemporarias.ResultadoPesquisa;
import enums.CATEGORIA_VEICULO;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import javax.websocket.server.PathParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.ConfigureSession;

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
            @RequestParam(value = "distancia", required = false) double distancia)
    {
        List<ResultadoPesquisa> lista = pesquisar(filtro_cat, filtro_carroc, rastreador, distancia);

        ModelAndView mav = new ModelAndView("pesquisarfretes");
        mav.addObject("resultados", lista);
        return mav;
    }

    private List<Historico> listHistorico(int transportadoras_id)
    {
        Historico historico = new Historico();
        Avaliacoes avaliacoes = new Avaliacoes();

       Session session = null;
        try
        {
            Join join = new Join(historico);
            join.addJoin(JOIN_TYPE.INNER, avaliacoes, "historico.avaliacoes_id = avaliacoes.id");
            join.addFinalCondition(" where historico.transportadoras_id = " + transportadoras_id);

            session = ConfigureSession.getSession();
            join.execute(session);
            session.close();

            List<Historico> lista = join.getList(historico);

            for (Historico h : lista)
            {
                avaliacoes = join.getEntity(Avaliacoes.class);
                h.setAvaliacoes(avaliacoes);
            }

            return lista;
        }
        catch (Exception ex)
        {
            if (session != null)
                session.close();
        }
        return new ArrayList<Historico>();
    }

    private List<ResultadoPesquisa> pesquisar(String filtro_cat, String filtro_carroc, boolean rastreador, double distancia)
    {
        List<ResultadoPesquisa> resultados = new ArrayList<ResultadoPesquisa>();

        String finalCondition = " where categorias_veiculos.id in (" + filtro_cat + ") ";
        finalCondition += "and carrocerias.id in (" + filtro_carroc + ") ";
        finalCondition += "and veiculos.rastreador = " + (rastreador == true ? "1" : "0");

        Transportadoras transportadora = new Transportadoras();
        Veiculos veiculos = new Veiculos();
        Carrocerias carroceria = new Carrocerias();
        Categorias_veiculos categoria_veiculo = new Categorias_veiculos();

        Session session = null;
        try
        {
            Join joinVeiculos = new Join(veiculos);
            joinVeiculos.addJoin(JOIN_TYPE.INNER, transportadora, "veiculos.transportadoras_id = transportadoras.id");
            joinVeiculos.addJoin(JOIN_TYPE.INNER, carroceria, "veiculos.carrocerias_id	 = carrocerias.id");
            joinVeiculos.addJoin(JOIN_TYPE.INNER, categoria_veiculo, "veiculos.categorias_veiculos_id = categorias_veiculos.id");
            joinVeiculos.addFinalCondition(finalCondition);

            session = ConfigureSession.getSession();
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

                ResultadoPesquisa resultado = new ResultadoPesquisa(veiculo, estrelas, preco_frete);
                resultados.add(resultado);
            }
        }
        catch (Exception ex)
        {
            if (session != null)
                session.close();
        }
        return resultados;
    }
}
