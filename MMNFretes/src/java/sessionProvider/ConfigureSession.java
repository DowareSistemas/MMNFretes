/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionProvider;

import br.com.persistor.enums.DB_TYPE;
import br.com.persistor.generalClasses.DBConfig;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.SessionFactory;

/**
 *
 * @author Marcos Vinícius
 */
public class ConfigureSession
{

    private static SessionFactory factory = null;

    public static Session getSession()
    {
        if (factory == null)
        {
            factory = new SessionFactory();
        }

        DBConfig config = new DBConfig();

        config.setDb_type(DB_TYPE.MySQL);
        config.setHost("localhost");
        config.setDatabase("mmn");
        config.setPort(3306);
        config.setUser("root");
        config.setPassword("81547686");
 
        return factory.getSession(config);
    }
}
