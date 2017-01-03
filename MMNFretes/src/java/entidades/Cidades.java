/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.OneToMany;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.LOAD;

/**
 *
 * @author Marcos Vinícius
 */
public class Cidades extends Entity
{

    private int id;
    private String nome;
    private int codigo_ibge;
    private int estado_id;
    private int populacao_2010;
    private double densidade_demo;
    private String gentilico;
    private double area;

    @PrimaryKey(increment = INCREMENT.AUTO)
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public int getCodigo_ibge()
    {
        return codigo_ibge;
    }

    public void setCodigo_ibge(int codigo_ibge)
    {
        this.codigo_ibge = codigo_ibge;
    }

    public int getEstado_id()
    {
        return estado_id;
    }

    public void setEstado_id(int estado_id)
    {
        this.estado_id = estado_id;
    }

    public int getPopulacao_2010()
    {
        return populacao_2010;
    }

    public void setPopulacao_2010(int populacao_2010)
    {
        this.populacao_2010 = populacao_2010;
    }

    public double getDensidade_demo()
    {
        return densidade_demo;
    }

    public void setDensidade_demo(double densidade_demo)
    {
        this.densidade_demo = densidade_demo;
    }

    public String getGentilico()
    {
        return gentilico;
    }

    public void setGentilico(String gentilico)
    {
        this.gentilico = gentilico;
    }

    public double getArea()
    {
        return area;
    }

    public void setArea(double area)
    {
        this.area = area;
    }

}
