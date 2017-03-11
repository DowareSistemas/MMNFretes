/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import br.com.persistor.interfaces.Session;
import controllers.OportunidadesController;
import controllers.TransportadorasController;
import entidades.Usuarios;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpSession;
import org.apache.catalina.ha.session.BackupManager;
import org.apache.catalina.session.StandardSession;
import org.postgresql.jdbc2.optional.SimpleDataSource;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{

    public static void main(String[] args)
    {
        System.out.println(new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime()));
    }
}
