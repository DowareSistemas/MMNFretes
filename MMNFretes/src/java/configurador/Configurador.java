/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configurador;

import br.com.persistor.annotations.NamedQuery;
import java.io.File;
import java.net.URLDecoder;

/**
 *
 * @author Marcos Vinícius
 */
public class Configurador
{

    public void configura()
    {
        StringBuilder builder = new StringBuilder();

        try
        {
            String path = this.getClass().getClassLoader().getResource("").getPath();
            String fullPath = URLDecoder.decode(path, "UTF-8");
            String pathArr[] = fullPath.split("/WEB-INF/classes/");
            System.out.println(fullPath);
            System.out.println(pathArr[0]);
            fullPath = pathArr[0];

            //  ServletContext context = getContext();
            File folder = new File(pathArr[0] + "/ARQUIVOSCONFIG/CidadesEstadosUfs.sql");
          
            
        } catch (Exception ex)
        {

        }
    }
}
