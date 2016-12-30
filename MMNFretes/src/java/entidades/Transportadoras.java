/* 28/09/2016 20:45:23 */
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
import java.io.InputStream;

/**
 *
 * @author Persistor4J
 */
public class Transportadoras extends Entity
{

    private int id;
    private String nome;
    private String CPF_CNPJ;
    private String ANTT;
    private String website;
    private InputStream foto_logo;
    private int usuarios_id;
    private Usuarios usuarios;
    private boolean pag_seguro;
    private boolean negociacao_direta;

    public boolean isPag_seguro()
    {
        return pag_seguro;
    }

    public void setPag_seguro(boolean pag_seguro)
    {
        this.pag_seguro = pag_seguro;
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

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public String getNome()
    {
        return nome;
    }

    public void setCPF_CNPJ(String CPF_CNPJ)
    {
        this.CPF_CNPJ = CPF_CNPJ;
    }

    public String getCPF_CNPJ()
    {
        return CPF_CNPJ;
    }

    public void setANTT(String ANTT)
    {
        this.ANTT = ANTT;
    }

    public String getANTT()
    {
        return ANTT;
    }

    public void setWebsite(String website)
    {
        this.website = website;
    }

    public String getWebsite()
    {
        return website;
    }

    public void setFoto_logo(InputStream foto_logo)
    {
        this.foto_logo = foto_logo;
    }

    public InputStream getFoto_logo()
    {
        return foto_logo;
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

    public void setNegociacao_direta(boolean negociacao_direta)
    {
        this.negociacao_direta = negociacao_direta;
    }

    public boolean isNegociacao_direta()
    {
        return negociacao_direta;
    }
}
