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
import logging.PersistenceLoggerImpl;

/**
 *
 * @author Marcos Vinícius
 */
public class SessionProvider
{

    private static SessionFactory factory = null;

    public static Session openSession()
    {
        try
        {
            if (factory == null)
                factory = new SessionFactory();

            DBConfig config = new DBConfig();

            config.setDb_type(DB_TYPE.MySQL);
            config.setHost("localhost");
            config.setDatabase("mmn");
            config.setPort(3306);
            config.setUser("root");
            config.setPassword("81547686");
            config.setMaxStatements(1000);
            config.setPersistenceLogger(PersistenceLoggerImpl.class);
            
            /*
            config.setDb_type(DB_TYPE.MySQL);
            config.setHost("192.175.112.170");
            config.setDatabase("doware_gcfretes");
            config.setPort(3306);
            config.setUser("doware_gcfretes");
            config.setPassword("R36?=x8%WqOV");
            config.setMaxStatements(1000);
            // config.setMaxPoolSize(10);
            config.setPersistenceLogger(PersistenceLoggerImpl.class);
            */

            return factory.getSession(config);
        }
        catch (Exception ex)
        {

        }
        return null;
    }
}
