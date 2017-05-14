/* 28/09/2016 20:45:22 */
 /* AUTO-GENERATED CLASS */
 /* DOES NOT ADD ACCESSOR METHODS */
 /* DOES NOT CHANGE NAME OF ACCESSOR METHODS */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;
import br.com.persistor.annotations.OneToOne;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.LOAD;
import br.com.persistor.sessionManager.FieldHandled;

/**
 *
 * @author Persistor4J
 */
public class Enderecos extends Entity
{

    private int id;
    private String cep;
    private String logradouro;
    private String bairro;
    private int municipio;
    private int uf;
    private boolean inativo;
    private int numero;
    private String complemento;
    private int usuarios_id;

    private Usuarios usuarios;
    private Cidades cidades;
    private Estados estados;

    @OneToOne(source = "uf", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.MANUAL)
    public Estados getEstados()
    {
        if(estados == null)
            estados = (Estados) FieldHandled.readObject(this, "estados");
        return estados;
    }

    public void setEstados(Estados estados)
    {
        this.estados = estados;
    }

    @OneToOne(source = "municipio", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.MANUAL)
    public Cidades getCidades()
    {
        if (cidades == null)
            cidades = (Cidades) FieldHandled.readObject(this, "cidades");
        return cidades;
    }

    public void setCidades(Cidades cidades)
    {
        this.cidades = cidades;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @PrimaryKey(increment = INCREMENT.MANUAL)
    public int getId()
    {
        return id;
    }

    public void setCep(String cep)
    {
        this.cep = cep;
    }

    public String getCep()
    {
        return cep;
    }

    public void setLogradouro(String logradouro)
    {
        this.logradouro = logradouro;
    }

    public String getLogradouro()
    {
        return logradouro;
    }

    public void setBairro(String bairro)
    {
        this.bairro = bairro;
    }

    public String getBairro()
    {
        return bairro;
    }

    public void setMunicipio(int municipio)
    {
        this.municipio = municipio;
    }

    public int getMunicipio()
    {
        return municipio;
    }

    public void setUf(int uf)
    {
        this.uf = uf;
    }

    public int getUf()
    {
        return uf;
    }

    public void setInativo(boolean inativo)
    {
        this.inativo = inativo;
    }

    public boolean isInativo()
    {
        return inativo;
    }

    public void setNumero(int numero)
    {
        this.numero = numero;
    }

    public int getNumero()
    {
        return numero;
    }

    public void setComplemento(String complemento)
    {
        this.complemento = complemento;
    }

    public String getComplemento()
    {
        return complemento;
    }

    public void setUsuarios(Usuarios usuarios)
    {
        this.usuarios = usuarios;
    }

    public void setUsuarios_id(int usuarios_id)
    {
        this.usuarios_id = usuarios_id;
    }

    public int getUsuarios_id()
    {
        return usuarios_id;
    }

    @OneToOne(source = "usuarios_id", target = "id", load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
    public Usuarios getUsuarios()
    {
        return usuarios;
    }
}
