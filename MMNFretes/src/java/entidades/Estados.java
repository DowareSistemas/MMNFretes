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
public class Estados extends Entity
{
    private int id;
    private String nome;
    private String sigla;
    
    private Cidades cidades;

    @OneToMany(source = "id", target = "estado_id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Cidades getCidades()
    {
        return cidades;
    }

    public void setCidades(Cidades cidades)
    {
        this.cidades = cidades;
    }
    
    
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

    public String getSigla()
    {
        return sigla;
    }

    public void setSigla(String sigla)
    {
        this.sigla = sigla;
    }
    
}
