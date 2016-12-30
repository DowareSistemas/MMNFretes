/* 28/09/2016 20:45:22 */
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
public class Historico extends Entity
{
   private int id; 
   private String cep_origem; 
   private String cep_destino; 
   private double distancia; 
   private Date data; 
   private double valor; 
   private int transportadoras_id; 
   private Transportadoras transportadoras; 
   private int veiculos_id; 
   private Veiculos veiculos; 
   private int usuarios_id; 
   private Usuarios usuarios; 
   private int avaliacoes_id; 
   private Avaliacoes avaliacoes; 

   public void setId(int id)
   {
       this.id = id;
   }

   @PrimaryKey(increment = INCREMENT.MANUAL)
   public int getId()
   {
       return id;
   }

   public void setCep_origem(String cep_origem)
   {
       this.cep_origem = cep_origem;
   }

   public String getCep_origem()
   {
       return cep_origem;
   }

   public void setCep_destino(String cep_destino)
   {
       this.cep_destino = cep_destino;
   }

   public String getCep_destino()
   {
       return cep_destino;
   }

   public void setDistancia(double distancia)
   {
       this.distancia = distancia;
   }

   public double getDistancia()
   {
       return distancia;
   }

   public void setData(Date data)
   {
       this.data = data;
   }

   public Date getData()
   {
       return data;
   }

   public void setValor(double valor)
   {
       this.valor = valor;
   }

   public double getValor()
   {
       return valor;
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

   @OneToOne(source = "transportadoras_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Transportadoras getTransportadoras()
   {
       return transportadoras;
   }


   public void setVeiculos(Veiculos veiculos)
   {
       this.veiculos = veiculos;
   }
   public void setVeiculos_id(int veiculos_id)
   {
       this.veiculos_id = veiculos_id;
   }

   public int getVeiculos_id()
   {
       return veiculos_id;
   }

   @OneToOne(source = "veiculos_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Veiculos getVeiculos()
   {
       return veiculos;
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

   @OneToOne(source = "usuarios_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Usuarios getUsuarios()
   {
       return usuarios;
   }

   public void setAvaliacoes(Avaliacoes avaliacoes)
   {
       this.avaliacoes = avaliacoes;
   }
   public void setAvaliacoes_id(int avaliacoes_id)
   {
       this.avaliacoes_id = avaliacoes_id;
   }

   public int getAvaliacoes_id()
   {
       return avaliacoes_id;
   }

   @OneToOne(source = "avaliacoes_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Avaliacoes getAvaliacoes()
   {
       return avaliacoes;
   }
}
