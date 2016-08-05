/* 03/08/2016 20:39:38 */
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
public class Enderecos extends Entity
{
   private int id; 
   private String CEP; 
   private String logradouro; 
   private String bairro; 
   private String municipio; 
   private String UF; 
   private boolean inativo; 
   private int numero; 
   private String complemento; 
   private int usuarios_id; 
   private Usuarios usuarios; 

   public void setId(int id)
   {
       this.id = id;
   }

   @PrimaryKey(increment = INCREMENT.AUTO)
   public int getId()
   {
       return id;
   }

   public void setCEP(String CEP)
   {
       this.CEP = CEP;
   }

   public String getCEP()
   {
       return CEP;
   }

   public void setLogradouro(String logradouro)
   {
       this.logradouro = logradouro;
   }

   public String getLogradouro()
   {
       return logradouro;
   }

   public void setBairro(String bairro)
   {
       this.bairro = bairro;
   }

   public String getBairro()
   {
       return bairro;
   }

   public void setMunicipio(String municipio)
   {
       this.municipio = municipio;
   }

   public String getMunicipio()
   {
       return municipio;
   }

   public void setUF(String UF)
   {
       this.UF = UF;
   }

   public String getUF()
   {
       return UF;
   }

   public void setInativo(boolean inativo)
   {
       this.inativo = inativo;
   }

   public boolean isInativo()
   {
       return inativo;
   }

   public void setNumero(int numero)
   {
       this.numero = numero;
   }

   public int getNumero()
   {
       return numero;
   }

   public void setComplemento(String complemento)
   {
       this.complemento = complemento;
   }

   public String getComplemento()
   {
       return complemento;
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

   @OneToOne(source = "usuarios_id", target = "id" , load = LOAD.MANUAL, join_type = JOIN_TYPE.INNER)
   public Usuarios getUsuarios()
   {
       return usuarios;
   }
}
