/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.NamedQuery;
import br.com.persistor.annotations.OneToOne;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.LOAD;
import br.com.persistor.sessionManager.FieldHandled;
import java.util.Date;

/**
 *
 * @author Marcos Vinícius
 */
@NamedQuery(queryName = "listaPedidosAdmin",
        queryValue = "select * from pedidos_vendas where data between cast(? as date) and cast(? as date) and status = 4")
public class Pedidos_vendas extends Entity
{

    private int id;
    private int produto_id;
    private double valor_unit;
    private double quant;
    private double valor_final;
    private int usuario_comprador;
    private int usuario_vendedor;
    private String cep_destino;
    private Date data;
    private int status;
    private double valor_frete;
    private int status_repasse;

    private Produtos produtos;
    private Usuarios usuarios;
    private Usuarios usuarioVendedor;

    public int getStatus_repasse()
    {
        return status_repasse;
    }

    public void setStatus_repasse(int status_repasse)
    {
        this.status_repasse = status_repasse;
    }

    @OneToOne(source = "usuario_vendedor", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.MANUAL)
    public Usuarios getUsuarioVendedor()
    {
        if (usuarioVendedor == null)
            usuarioVendedor = (Usuarios) FieldHandled.readObject(this, "usuarioVendedor");
        return usuarioVendedor;
    }

    public void setUsuarioVendedor(Usuarios usuarioVendedor)
    {
        this.usuarioVendedor = usuarioVendedor;
    }

    @OneToOne(source = "usuario_comprador", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Usuarios getUsuarios()
    {
        if (usuarios == null)
            usuarios = (Usuarios) FieldHandled.readObject(this, "usuarios");
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios)
    {
        this.usuarios = usuarios;
    }

    @OneToOne(source = "produto_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO, ignore_onID = "foto")
    public Produtos getProdutos()
    {
        if (produtos == null)
            produtos = (Produtos) FieldHandled.readObject(this, "produtos");
        return produtos;
    }

    public void setProdutos(Produtos produtos)
    {
        this.produtos = produtos;
    }

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

    public int getUsuario_comprador()
    {
        return usuario_comprador;
    }

    public void setUsuario_comprador(int usuario_comprador)
    {
        this.usuario_comprador = usuario_comprador;
    }

    public int getUsuario_vendedor()
    {
        return usuario_vendedor;
    }

    public void setUsuario_vendedor(int usuario_vendedor)
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

    public int getStatus()
    {
        return status;
    }

    public void setStatus(int status)
    {
        this.status = status;
    }
}
