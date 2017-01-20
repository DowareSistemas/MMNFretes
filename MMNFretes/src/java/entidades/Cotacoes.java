/* 28/09/2016 20:45:21 */
 /* AUTO-GENERATED CLASS */
 /* DOES NOT ADD ACCESSOR METHODS */
 /* DOES NOT CHANGE NAME OF ACCESSOR METHODS */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.NamedQuery;
import br.com.persistor.annotations.NamedQueryes;
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
@NamedQueryes(
        value =
        {
            @NamedQuery(queryName = "updateStatus",
                    queryValue = "update cotacoes set status = ? where grupo_cotacoes_id = ?"),

            @NamedQuery(queryName = "deletaCotacoesRestantes",
                    queryValue = "delete from cotacoes where grupo_cotacoes_id = ? and id <> ?"),

            @NamedQuery(queryName = "deletaGrupos",
                    queryValue = "delete from grupos_cotacoes where id = ?")
        })
public class Cotacoes extends Entity
{

    private int id;
    private double valor;
    private int status;
    private Date data;
    private String cep_origem;
    private String cep_destino;
    private double distancia;
    private boolean desconto_pendente;
    private boolean desconto_bloqueado;
    private int usuarios_id;
    private int transportadoras_id;
    private int veiculos_id;
    private int grupo_cotacoes_id;
    private String token_envio;
    private String token_resposta;

    private Usuarios usuarios;
    private Transportadoras transportadoras;
    private Veiculos veiculos;

    public Cotacoes()
    {
        this.token_envio = "";
        this.token_resposta = "";
    }

    public String getToken_envio()
    {
        return token_envio;
    }

    public void setToken_envio(String token_envio)
    {
        this.token_envio = token_envio;
    }

    public String getToken_resposta()
    {
        return token_resposta;
    }

    public void setToken_resposta(String token_resposta)
    {
        this.token_resposta = token_resposta;
    }

    public Date getData()
    {
        return data;
    }

    public void setData(Date data)
    {
        this.data = data;
    }

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

    @OneToOne(source = "veiculos_id", target = "id", join_type = JOIN_TYPE.INNER, load = LOAD.AUTO, ignore_onID =
    {
        "foto"
    })
    public Veiculos getVeiculos()
    {
        return veiculos;
    }

    public void setVeiculos(Veiculos veiculos)
    {
        this.veiculos = veiculos;
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

    public boolean isDesconto_pendente()
    {
        return desconto_pendente;
    }

    public void setDesconto_pendente(boolean desconto_pendente)
    {
        this.desconto_pendente = desconto_pendente;
    }

    public boolean isDesconto_bloqueado()
    {
        return desconto_bloqueado;
    }

    public void setDesconto_bloqueado(boolean desconto_bloqueado)
    {
        this.desconto_bloqueado = desconto_bloqueado;
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
