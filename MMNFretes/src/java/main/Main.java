/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import br.com.persistor.interfaces.Session;
import controllers.RepresetacoesController;
import entidades.Transportadoras;
import entidades.Usuarios;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{

    public static void main(String[] args)
    {
        Calendar calendar = Calendar.getInstance();
        Date dataInicio = br.com.persistor.generalClasses.Util.getDate(1, calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        Date dataFim = br.com.persistor.generalClasses.Util.getDate(calendar.getActualMaximum(Calendar.DATE), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        System.err.println(dateFormat.format(dataInicio));
        System.err.println(dateFormat.format(dataFim));
    }
}
