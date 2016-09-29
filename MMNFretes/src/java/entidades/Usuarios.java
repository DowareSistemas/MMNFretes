/* 28/09/2016 20:45:23 */
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
public class Usuarios extends Entity
{
   private int id; 
   private String nome; 
   private String senha; 
   private String email; 
   private int tipo_usuario; 
   private String telefone1; 
   private String telefone2; 
   private boolean admin; 
   private boolean inativo; 

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

   public void setSenha(String senha)
   {
       this.senha = senha;
   }

   public String getSenha()
   {
       return senha;
   }

   public void setEmail(String email)
   {
       this.email = email;
   }

   public String getEmail()
   {
       return email;
   }

   public void setTipo_usuario(int tipo_usuario)
   {
       this.tipo_usuario = tipo_usuario;
   }

   public int getTipo_usuario()
   {
       return tipo_usuario;
   }

   public void setTelefone1(String telefone1)
   {
       this.telefone1 = telefone1;
   }

   public String getTelefone1()
   {
       return telefone1;
   }

   public void setTelefone2(String telefone2)
   {
       this.telefone2 = telefone2;
   }

   public String getTelefone2()
   {
       return telefone2;
   }

   public void setAdmin(boolean admin)
   {
       this.admin = admin;
   }

   public boolean isAdmin()
   {
       return admin;
   }

   public void setInativo(boolean inativo)
   {
       this.inativo = inativo;
   }

   public boolean isInativo()
   {
       return inativo;
   }
}
