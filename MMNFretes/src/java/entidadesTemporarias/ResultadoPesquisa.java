/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import entidades.Avaliacoes;
import entidades.Transportadoras;
import entidades.Veiculos;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marcos Vinícius
 */
public class ResultadoPesquisa
{

    private Veiculos veiculo;
    private List<Avaliacoes> av_positivas;
    private List<Avaliacoes> av_negativas;
    private double preco_frete;

    public ResultadoPesquisa()
    {
        av_negativas = new ArrayList<Avaliacoes>();
        av_negativas = new ArrayList<Avaliacoes>();
    }

    public Veiculos getVeiculo()
    {
        return veiculo;
    }

    public void setVeiculo(Veiculos veiculo)
    {
        this.veiculo = veiculo;
    }

    public List<Avaliacoes> getAv_positivas()
    {
        return av_positivas;
    }

    public void setAv_positivas(List<Avaliacoes> av_positivas)
    {
        this.av_positivas = av_positivas;
    }

    public List<Avaliacoes> getAv_negativas()
    {
        return av_negativas;
    }

    public void setAv_negativas(List<Avaliacoes> av_negativas)
    {
        this.av_negativas = av_negativas;
    }

    public double getPreco_frete()
    {
        return preco_frete;
    }

    public void setPreco_frete(double preco_frete)
    {
        this.preco_frete = preco_frete;
    }
}
