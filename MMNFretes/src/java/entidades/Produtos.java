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
import java.io.InputStream;

/**
 *
 * @author Marcos Vinícius
 */
@NamedQuery(queryName = "listaProdutosRepresentante",
        queryValue = "select id, nome, descricao, tipo, preco, usuario_id, unidade, quant, foto "
        + "from produtos where usuario_id = ? limit 6")
public class Produtos extends Entity
{

    private int id;
    private String nome;
    private String descricao;
    private int tipo;
    private double preco;
    private int usuario_id;
    private InputStream foto;
    private String unidade;
    private double quant;

    private Usuarios usuarios;

    @OneToOne(source = "usuario_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Usuarios getUsuarios()
    {
        if(usuarios == null)
            usuarios = (Usuarios) FieldHandled.readObject(this, "usuarios");
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios)
    {
        this.usuarios = usuarios;
    }

    public double getQuant()
    {
        return quant;
    }

    public void setQuant(double quant)
    {
        this.quant = quant;
    }

    public InputStream getFoto()
    {
        return foto;
    }

    public String getUnidade()
    {
        return unidade;
    }

    public void setUnidade(String unidade)
    {
        this.unidade = unidade;
    }

    public void setFoto(InputStream foto)
    {
        this.foto = foto;
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

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public String getDescricao()
    {
        return descricao;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public int getTipo()
    {
        return tipo;
    }

    public void setTipo(int tipo)
    {
        this.tipo = tipo;
    }

    public double getPreco()
    {
        return preco;
    }

    public void setPreco(double preco)
    {
        this.preco = preco;
    }

    public int getUsuario_id()
    {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id)
    {
        this.usuario_id = usuario_id;
    }
}
