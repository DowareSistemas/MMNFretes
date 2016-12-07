/* 28/09/2016 20:45:21 */
 /* AUTO-GENERATED CLASS */
 /* DOES NOT ADD ACCESSOR METHODS */
 /* DOES NOT CHANGE NAME OF ACCESSOR METHODS */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.NamedQuery;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;
import br.com.persistor.annotations.OneToOne;
import br.com.persistor.annotations.OneToMany;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.LOAD;
import java.util.Date;
import java.io.InputStream;

/**
 *
 * @author Persistor4J
 */
@NamedQuery(queryName = "updateStatus", queryValue = "update cotacoes set status = ? where grupo_cotacoes_id = ?")
public class Cotacoes extends Entity
{
    private int id;
    private double valor;
    private int status;
    private String cep_origem;
    private String cep_destino;
    private double distancia;
    private int usuarios_id;
    private int transportadoras_id;
    private int veiculos_id;
    private int grupo_cotacoes_id;

    private Usuarios usuarios;
    private Transportadoras transportadoras;
    private Veiculos veiculos;

    @OneToOne(source = "usuarios_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Usuarios getUsuarios()
    {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios)
    {
        this.usuarios = usuarios;
    }

    @OneToOne(source = "transportadoras_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Transportadoras getTransportadoras()
    {
        return transportadoras;
    }

    public void setTransportadoras(Transportadoras transportadoras)
    {
        this.transportadoras = transportadoras;
    }

    @OneToOne(source = "veiculos_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO)
    public Veiculos getVeiculos()
    {
        return veiculos;
    }

    public void setVeiculos(Veiculos veiculos)
    {
        this.veiculos = veiculos;
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

    public double getValor()
    {
        return valor;
    }

    public void setValor(double valor)
    {
        this.valor = valor;
    }

    public int getStatus()
    {
        return status;
    }

    public void setStatus(int status)
    {
        this.status = status;
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

    public double getDistancia()
    {
        return distancia;
    }

    public void setDistancia(double distancia)
    {
        this.distancia = distancia;
    }

    public int getUsuarios_id()
    {
        return usuarios_id;
    }

    public void setUsuarios_id(int usuario_id)
    {
        this.usuarios_id = usuario_id;
    }

    public int getTransportadoras_id()
    {
        return transportadoras_id;
    }

    public void setTransportadoras_id(int transportadora_id)
    {
        this.transportadoras_id = transportadora_id;
    }

    public int getVeiculos_id()
    {
        return veiculos_id;
    }

    public void setVeiculos_id(int veiculos_id)
    {
        this.veiculos_id = veiculos_id;
    }

    public int getGrupo_cotacoes_id()
    {
        return grupo_cotacoes_id;
    }

    public void setGrupo_cotacoes_id(int grupo_cotacoes_id)
    {
        this.grupo_cotacoes_id = grupo_cotacoes_id;
    }

}
