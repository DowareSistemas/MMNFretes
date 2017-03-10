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
import javax.servlet.http.HttpSession;
import org.apache.catalina.ha.session.BackupManager;
import org.apache.catalina.session.StandardSession;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{

    public static void main(String[] args)
    {
        Session session = SessionProvider.openSession();
        TransportadorasController tc = new TransportadorasController();
       
        System.out.println(tc.getValorParticipativo(1, session));
    }
}
