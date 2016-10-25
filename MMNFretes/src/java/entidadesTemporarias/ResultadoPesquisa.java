/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

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
    private List<Integer> av_positivas;
    private List<Integer> av_negativas;
    private double preco_frete;

    public ResultadoPesquisa(Veiculos veiculo, int av_posit, double preco)
    {
        av_negativas = new ArrayList<Integer>();
        av_negativas = new ArrayList<Integer>();
        
        for(int i = 0; i < av_posit; i ++)
        {
            av_positivas.add(i);
        }
        
        int negativas = (Math.round(av_posit) - 5);
        for(int i = 0; i < negativas; i++)
        {
            av_negativas.add(i);
        }

        this.preco_frete = preco;
        this.veiculo = veiculo;
    }

    public Veiculos getVeiculo()
    {
        return veiculo;
    }

    public void setVeiculo(Veiculos veiculo)
    {
        this.veiculo = veiculo;
    }

    public List<Integer> getAv_positivas()
    {
        return av_positivas;
    }

    public void setAv_positivas(List<Integer> av_positivas)
    {
        this.av_positivas = av_positivas;
    }

    public List<Integer> getAv_negativas()
    {
        return av_negativas;
    }

    public void setAv_negativas(List<Integer> av_negativas)
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
