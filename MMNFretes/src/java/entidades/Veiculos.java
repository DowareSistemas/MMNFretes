/* 03/10/2016 22:27:44 */
 /* AUTO-GENERATED CLASS */
 /* DOES NOT ADD ACCESSOR METHODS */
 /* DOES NOT CHANGE NAME OF ACCESSOR METHODS */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.abstractClasses.Entity;
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
public class Veiculos extends Entity
{

    private int id;
    private String descricao;
    private int capacidade;
    private int tipo_carga;
    private double preco_frete;
    private int tipo_cobranca;
    private boolean rastreador;
    private boolean inativo;
    private int categorias_veiculos_id;
    private Categorias_veiculos categorias_veiculos;
    private int transportadoras_id;
    private Transportadoras transportadoras;
    private int tipos_carga_id;
    private Tipos_carga tipos_carga;
    private int carrocerias_id;
    private Carrocerias carrocerias;
    private InputStream foto;
    private String placa;

    public String getPlaca()
    {
        return placa;
    }

    public void setPlaca(String placa)
    {
        this.placa = placa;
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

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public String getDescricao()
    {
        return descricao;
    }

    public void setCapacidade(int capacidade)
    {
        this.capacidade = capacidade;
    }

    public int getCapacidade()
    {
        return capacidade;
    }

    public void setTipo_carga(int tipo_carga)
    {
        this.tipo_carga = tipo_carga;
    }

    public int getTipo_carga()
    {
        return tipo_carga;
    }

    public void setPreco_frete(double preco_frete)
    {
        this.preco_frete = preco_frete;
    }

    public double getPreco_frete()
    {
        return preco_frete;
    }

    public void setTipo_cobranca(int tipo_cobranca)
    {
        this.tipo_cobranca = tipo_cobranca;
    }

    public int getTipo_cobranca()
    {
        return tipo_cobranca;
    }

    public void setRastreador(boolean rastreador)
    {
        this.rastreador = rastreador;
    }

    public boolean isRastreador()
    {
        return rastreador;
    }

    public void setInativo(boolean inativo)
    {
        this.inativo = inativo;
    }

    public boolean isInativo()
    {
        return inativo;
    }

    public void setCategorias_veiculos(Categorias_veiculos categorias_veiculos)
    {
        this.categorias_veiculos = categorias_veiculos;
    }

    public void setCategorias_veiculos_id(int categorias_veiculos_id)
    {
        this.categorias_veiculos_id = categorias_veiculos_id;
    }

    public int getCategorias_veiculos_id()
    {
        return categorias_veiculos_id;
    }

    @OneToOne(source = "categorias_veiculos_id", target = "id", load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
    public Categorias_veiculos getCategorias_veiculos()
    {
        return categorias_veiculos;
    }

    public void setTransportadoras(Transportadoras transportadoras)
    {
        this.transportadoras = transportadoras;
    }

    public void setTransportadoras_id(int transportadoras_id)
    {
        this.transportadoras_id = transportadoras_id;
    }

    public int getTransportadoras_id()
    {
        return transportadoras_id;
    }

    @OneToOne(source = "transportadoras_id", target = "id", load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
    public Transportadoras getTransportadoras()
    {
        return transportadoras;
    }

    public void setTipos_carga(Tipos_carga tipos_carga)
    {
        this.tipos_carga = tipos_carga;
    }

    public void setTipos_carga_id(int tipos_carga_id)
    {
        this.tipos_carga_id = tipos_carga_id;
    }

    public int getTipos_carga_id()
    {
        return tipos_carga_id;
    }

    @OneToOne(source = "tipos_carga_id", target = "id", load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
    public Tipos_carga getTipos_carga()
    {
        return tipos_carga;
    }

    public void setCarrocerias(Carrocerias carrocerias)
    {
        this.carrocerias = carrocerias;
    }

    public void setCarrocerias_id(int carrocerias_id)
    {
        this.carrocerias_id = carrocerias_id;
    }

    public int getCarrocerias_id()
    {
        return carrocerias_id;
    }

    @OneToOne(source = "carrocerias_id", target = "id", load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
    public Carrocerias getCarrocerias()
    {
        return carrocerias;
    }

    public void setFoto(InputStream foto)
    {
        this.foto = foto;
    }

    public InputStream getFoto()
    {
        return foto;
    }
}
