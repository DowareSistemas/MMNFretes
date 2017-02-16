/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.OneToOne;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.LOAD;

/**
 *
 * @author Marcos Vinícius
 */
public class Oportunidades extends Entity
{

    private int id;
    private String cep_origem;
    private String cep_destino;
    private String comprimento;
    private String altura;
    private String largura;
    private String peso;
    private String volumes;
    private String observacoes;
    private String categorias;
    private String carrocerias;
    private String tipo_carga;
    private boolean rastreador;
    private boolean pagseguro;
    private boolean negoc_direta;
    private int usuario_id;
    private double distancia;

    public Oportunidades()
    {
        id = 0;
        this.cep_origem = "";
        this.cep_destino = "";
        this.comprimento = "";
        this.altura = "";
        this.altura = "";
        this.peso = "";
        this.volumes = "";
        this.observacoes = "";
        this.categorias = "";
        this.carrocerias = "";
        this.tipo_carga = "";
        this.categorias = "";
        this.distancia = 0;
    }

    public double getDistancia()
    {
        return distancia;
    }

    public void setDistancia(double distancia)
    {
        this.distancia = distancia;
    }

    public int getUsuario_id()
    {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id)
    {
        this.usuario_id = usuario_id;
    }

    private Usuarios usuarios;

    @OneToOne(source = "usuario_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Usuarios getUsuarios()
    {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios)
    {
        this.usuarios = usuarios;
    }

    @PrimaryKey(increment = INCREMENT.MANUAL)
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getCep_origem()
    {
        return cep_origem;
    }

    public void setCep_origem(String cep_origem)
    {
        this.cep_origem = cep_origem;
    }

    public String getCep_destino()
    {
        return cep_destino;
    }

    public void setCep_destino(String cep_destino)
    {
        this.cep_destino = cep_destino;
    }

    public String getComprimento()
    {
        return comprimento;
    }

    public void setComprimento(String comprimento)
    {
        this.comprimento = comprimento;
    }

    public String getAltura()
    {
        return altura;
    }

    public void setAltura(String altura)
    {
        this.altura = altura;
    }

    public String getLargura()
    {
        return largura;
    }

    public void setLargura(String largura)
    {
        this.largura = largura;
    }

    public String getPeso()
    {
        return peso;
    }

    public void setPeso(String peso)
    {
        this.peso = peso;
    }

    public String getVolumes()
    {
        return volumes;
    }

    public void setVolumes(String volumes)
    {
        this.volumes = volumes;
    }

    public String getObservacoes()
    {
        return observacoes;
    }

    public void setObservacoes(String observacoes)
    {
        this.observacoes = observacoes;
    }

    public String getCategorias()
    {
        return categorias;
    }

    public void setCategorias(String categorias)
    {
        this.categorias = categorias;
    }

    public String getCarrocerias()
    {
        return carrocerias;
    }

    public void setCarrocerias(String carrocerias)
    {
        this.carrocerias = carrocerias;
    }

    public String getTipo_carga()
    {
        return tipo_carga;
    }

    public void setTipo_carga(String tipo_carga)
    {
        this.tipo_carga = tipo_carga;
    }

    public boolean isRastreador()
    {
        return rastreador;
    }

    public void setRastreador(boolean rastreador)
    {
        this.rastreador = rastreador;
    }

    public boolean isPagseguro()
    {
        return pagseguro;
    }

    public void setPagseguro(boolean pagseguro)
    {
        this.pagseguro = pagseguro;
    }

    public boolean isNegoc_direta()
    {
        return negoc_direta;
    }

    public void setNegoc_direta(boolean negoc_direta)
    {
        this.negoc_direta = negoc_direta;
    }

}
