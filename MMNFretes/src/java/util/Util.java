/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entidades.Usuarios;
import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marcos Vinícius
 */
public class Util
{

    public static boolean isUsuario(Usuarios usuario)
    {
        if (usuario.getTipo_usuario() == 0)
        {
            return true;
        } else
        {
            return false;
        }
    }

    public List<String> getListaCidades()
    {

        List<String> cidades = new ArrayList<String>();
        try
        {
            String path = this.getClass().getClassLoader().getResource("").getPath();
            String fullPath = URLDecoder.decode(path, "UTF-8");
            String pathArr[] = fullPath.split("/WEB-INF/classes/");
            System.out.println(fullPath);
            System.out.println(pathArr[0]);
            fullPath = pathArr[0];

            //  ServletContext context = getContext();
            File folder = new File(pathArr[0] + "/ARQUIVOSCONFIG/");
          

        } catch (Exception ex)
        {
            ex.printStackTrace();;
        }

        return cidades;
    }

    public static List<String> getListaUFs()
    {
        List<String> listaRetorno = new ArrayList<String>();

        listaRetorno.add("AC");
        listaRetorno.add("AL");
        listaRetorno.add("AP");
        listaRetorno.add("AM");
        listaRetorno.add("BA");
        listaRetorno.add("CE");
        listaRetorno.add("DF");
        listaRetorno.add("ES");
        listaRetorno.add("GO");
        listaRetorno.add("MA");
        listaRetorno.add("MT");
        listaRetorno.add("MS");
        listaRetorno.add("MG");
        listaRetorno.add("PR");
        listaRetorno.add("PB");
        listaRetorno.add("PA");
        listaRetorno.add("PE");
        listaRetorno.add("PI");
        listaRetorno.add("RJ");
        listaRetorno.add("RN");
        listaRetorno.add("RS");
        listaRetorno.add("RO");
        listaRetorno.add("RR");
        listaRetorno.add("SC");
        listaRetorno.add("SE");
        listaRetorno.add("SP");
        listaRetorno.add("TO");

        return listaRetorno;
    }
}
