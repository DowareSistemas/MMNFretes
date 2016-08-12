/* 12/08/2016 19:35:14 */
/* AUTO-GENERATED CLASS */
/* DOES NOT ADD ACCESSOR METHODS */
/* DOES NOT CHANGE NAME OF ACCESSOR METHODS */

package Entidades;

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
public class Cidade extends Entity
{
   private int id; 
   private String nome; 
   private int estado_id; 
   private Estado estado; 

   public void setId(int id)
   {
       this.id = id;
   }

   @PrimaryKey(increment = INCREMENT.AUTO)
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


   public void setEstado(Estado estado)
   {
       this.estado = estado;
   }
   public void setEstado_id(int estado_id)
   {
       this.estado_id = estado_id;
   }

   public int getEstado_id()
   {
       return estado_id;
   }

   @OneToOne(source = "estado_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Estado getEstado()
   {
       return estado;
   }
}
