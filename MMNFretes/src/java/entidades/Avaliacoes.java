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
public class Avaliacoes extends Entity
{
   private int id; 
   private String comentario; 
   private int estrelas; 

   public void setId(int id)
   {
       this.id = id;
   }

   @PrimaryKey(increment = INCREMENT.MANUAL)
   public int getId()
   {
       return id;
   }

   public void setComentario(String comentario)
   {
       this.comentario = comentario;
   }

   public String getComentario()
   {
       return comentario;
   }

   public void setEstrelas(int estrelas)
   {
       this.estrelas = estrelas;
   }

   public int getEstrelas()
   {
       return estrelas;
   }
}
