/* 12/08/2016 19:35:15 */
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
public class Pais extends Entity
{
   private int id; 
   private String nome; 
   private String sigla; 

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

   public void setSigla(String sigla)
   {
       this.sigla = sigla;
   }

   public String getSigla()
   {
       return sigla;
   }
}
