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
import java.util.Date;

/**
 *
 * @author Marcos Vinícius
 */
public class Pedidos_vendas extends Entity
{

    private int id;
    private int produto_id;
    private double valor_unit;
    private double quant;
    private double valor_final;
    private double usuario_comprador;
    private double usuario_vendedor;
    private String cep_destino;
    private Date data;
    private boolean atendido;
    private boolean pago;
    private double valor_frete;

    private Produtos produtos;

    public String getCep_destino()
    {
        return cep_destino;
    }

    public void setCep_destino(String cep_destino)
    {
        this.cep_destino = cep_destino;
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

    public double getValor_frete()
    {
        return valor_frete;
    }

    public void setValor_frete(double valor_frete)
    {
        this.valor_frete = valor_frete;
    }

    public int getProduto_id()
    {
        return produto_id;
    }

    public void setProduto_id(int produto_id)
    {
        this.produto_id = produto_id;
    }

    public double getValor_unit()
    {
        return valor_unit;
    }

    public void setValor_unit(double valor_unit)
    {
        this.valor_unit = valor_unit;
    }

    public double getQuant()
    {
        return quant;
    }

    public void setQuant(double quant)
    {
        this.quant = quant;
    }

    public double getValor_final()
    {
        return valor_final;
    }

    public void setValor_final(double valor_final)
    {
        this.valor_final = valor_final;
    }

    public double getUsuario_comprador()
    {
        return usuario_comprador;
    }

    public void setUsuario_comprador(double usuario_comprador)
    {
        this.usuario_comprador = usuario_comprador;
    }

    public double getUsuario_vendedor()
    {
        return usuario_vendedor;
    }

    public void setUsuario_vendedor(double usuario_vendedor)
    {
        this.usuario_vendedor = usuario_vendedor;
    }

    public Date getData()
    {
        return data;
    }

    public void setData(Date data)
    {
        this.data = data;
    }

    public boolean isAtendido()
    {
        return atendido;
    }

    public void setAtendido(boolean atendido)
    {
        this.atendido = atendido;
    }

    public boolean isPago()
    {
        return pago;
    }

    public void setPago(boolean pago)
    {
        this.pago = pago;
    }

    @OneToOne(source = "produto_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO, ignore_onID = "foto")
    public Produtos getProdutos()
    {
        return produtos;
    }

    public void setProdutos(Produtos produtos)
    {
        this.produtos = produtos;
    }

}
