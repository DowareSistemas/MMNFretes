/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import br.com.persistor.interfaces.Session;
import controllers.OportunidadesController;
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
       /* 
        Session session  =SessionProvider.openSession();
        Usuarios u = session.onID(Usuarios.class, 4);

        HttpSession h = new StandardSession(new BackupManager());
        h.setAttribute("usuarioLogado", u);
        
        OportunidadesController oc = new OportunidadesController();
        oc.list(h, "teste");
        
        */
        
        
        
        
        
        
        
        
        
        
        
        
       /* try
        {
            PagseguroController pc = new PagseguroController();
            pc.consultaNotificacao("142B29-B6AB57AB57D0-9BB4509F88B8-0EC661");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }*/
    }
}
