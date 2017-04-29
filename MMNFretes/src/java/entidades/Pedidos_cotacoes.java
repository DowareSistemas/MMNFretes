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
public class Pedidos_cotacoes extends Entity
{

    private int id;
    private int cotacao_id;
    private int pedido_id;

    private Cotacoes cotacoes;
    private Pedidos_vendas pedidos_vendas;

    @PrimaryKey(increment = INCREMENT.MANUAL)
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getCotacao_id()
    {
        return cotacao_id;
    }

    public void setCotacao_id(int cotacao_id)
    {
        this.cotacao_id = cotacao_id;
    }

    public int getPedido_id()
    {
        return pedido_id;
    }

    public void setPedido_id(int pedido_id)
    {
        this.pedido_id = pedido_id;
    }

    @OneToOne(source = "cotacao_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Cotacoes getCotacoes()
    {
        return cotacoes;
    }

    public void setCotacoes(Cotacoes cotacoes)
    {
        this.cotacoes = cotacoes;
    }

    @OneToOne(source = "pedido_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Pedidos_vendas getPedidos_vendas()
    {
        return pedidos_vendas;
    }

    public void setPedidos_vendas(Pedidos_vendas pedidos_vendas)
    {
        this.pedidos_vendas = pedidos_vendas;
    }

}
