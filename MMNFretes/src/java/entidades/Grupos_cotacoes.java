/* 28/09/2016 20:45:22 */
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
@NamedQuery(queryName = "listaGrupos", queryValue = "select distinct(gc.id), gc.descricao from grupos_cotacoes gc\n" +
"inner join cotacoes ct on gc.id = ct.grupo_cotacoes_id\n" +
"where ct.usuarios_id = ? and ct.status <> 0")
public class Grupos_cotacoes extends Entity
{
   private int id; 
   private String descricao; 

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
}
