/* 12/08/2016 19:35:15 */
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
public class Estado extends Entity
{
   private int id; 
   private String nome; 
   private String uf; 
   private int pais_id; 
   private Pais pais; 

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

   public void setUf(String uf)
   {
       this.uf = uf;
   }

   public String getUf()
   {
       return uf;
   }


   public void setPais(Pais pais)
   {
       this.pais = pais;
   }
   public void setPais_id(int pais_id)
   {
       this.pais_id = pais_id;
   }

   public int getPais_id()
   {
       return pais_id;
   }

   @OneToOne(source = "pais_id", target = "id" , load = LOAD.AUTO, join_type = JOIN_TYPE.INNER)
   public Pais getPais()
   {
       return pais;
   }
}
