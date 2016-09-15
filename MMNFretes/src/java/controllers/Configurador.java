/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entidades.Cidade;
import br.com.persistor.interfaces.Session;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.net.URLDecoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.ConfigureSession;

/**
 *
 * @author Marcos Vinícius
 */

@Controller
public class Configurador
{
    @RequestMapping("/Configura")
    public @ResponseBody String configura()
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
            File arquivo = new File(pathArr[0] + "/ARQUIVOSCONFIG/CidadesEstadosUfs.sql");

            BufferedReader br = new BufferedReader(new FileReader(arquivo));
            while (br.ready())
            {
                String linha = br.readLine();
                builder.append(linha + "\n");
            }
            br.close();

            System.out.println(builder.toString());
            Session session = ConfigureSession.getSession();
            session.getActiveConnection().prepareStatement(builder.toString()).execute();
            session.close();
            
            return builder.toString();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            
            return ex.getMessage();
        }
    }
}
