/* 28/09/2016 20:45:21 */
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
public class Cotacoes extends Entity
{
   private double valor; 
   private int status; 
   private boolean aprovado; 
   private int usuarios_id; 
   private Usuarios usuarios; 
   private int transportadoras_id; 
   private Transportadoras transportadoras; 
   private int veiculos_id; 
   private Veiculos veiculos; 
   private int grupos_contacoes_id; 
   private Grupos_contacoes grupos_contacoes; 

   public void setValor(double valor)
   {
       this.valor = valor;
   }

   public double getValor()
   {
       return valor;
   }

   public void setStatus(int status)
   {
       this.status = status;
   }

   public int getStatus()
   {
       return status;
   }

   public void setAprovado(boolean aprovado)
   {
       this.aprovado = aprovado;
   }

   public boolean isAprovado()
   {
       return aprovado;
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


   public void setGrupos_contacoes(Grupos_contacoes grupos_contacoes)
   {
       this.grupos_contacoes = grupos_contacoes;
   }
   public void setGrupos_contacoes_id(int grupos_contacoes_id)
   {
       this.grupos_contacoes_id = grupos_contacoes_id;
   }

   public int getGrupos_contacoes_id()
   {
       return grupos_contacoes_id;
   }

   @OneToOne(source = "grupos_contacoes_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Grupos_contacoes getGrupos_contacoes()
   {
       return grupos_contacoes;
   }
}
