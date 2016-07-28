/* 27/07/2016 21:29:00 */
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
public class Precos_frete extends Entity
{
   private int id; 
   private int transportadoras_id; 
   private Transportadoras transportadoras; 
   private int tipo_cobranca; 
   private double preco_base; 

   public void setId(int id)
   {
       this.id = id;
   }

   @PrimaryKey(increment = INCREMENT.AUTO)
   public int getId()
   {
       return id;
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

   public void setTipo_cobranca(int tipo_cobranca)
   {
       this.tipo_cobranca = tipo_cobranca;
   }

   public int getTipo_cobranca()
   {
       return tipo_cobranca;
   }

   public void setPreco_base(double preco_base)
   {
       this.preco_base = preco_base;
   }

   public double getPreco_base()
   {
       return preco_base;
   }
}
