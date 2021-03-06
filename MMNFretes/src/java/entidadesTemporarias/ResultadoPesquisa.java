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
    private String foto_path;

    public ResultadoPesquisa(Veiculos veiculo, int av_posit, double preco, String foto)
    {
        av_positivas = new ArrayList<Integer>();
        av_negativas = new ArrayList<Integer>();

        for (int i = 0; i < av_posit; i++)
        {
            av_positivas.add(i);
        }

        int negativas = 0;

        if (av_positivas.isEmpty())
            negativas = 5;
        else if (av_posit == 4)
            negativas = 1;
        else if(av_posit == 3)
            negativas = 2;
        else if(av_posit == 2)
            negativas = 3;
        else if(av_posit == 1)
            negativas = 4;

        for (int i = 0; i < negativas; i++)
        {
            av_negativas.add(i);
        }

        this.preco_frete = preco;
        this.veiculo = veiculo;
        this.foto_path = foto.isEmpty() ? "none" : foto;
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

    public String getFoto_path()
    {
        return foto_path;
    }

    public void setFoto_path(String foto_path)
    {
        this.foto_path = foto_path;
    }
}
