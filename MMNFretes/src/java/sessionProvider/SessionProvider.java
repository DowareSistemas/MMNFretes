/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionProvider;

import br.com.persistor.enums.DB_TYPE;
import br.com.persistor.generalClasses.DBConfig;
import br.com.persistor.generalClasses.PersistenceLog;
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

            config.setDb_type(DB_TYPE.PostgreSQL);
            config.setHost("localhost");
            config.setDatabase("mmn_teste");
            config.setPort(5432);
            config.setUser("postgres");
            config.setPassword("81547686");
            config.setMaxStatements(1000);
            config.setPersistenceLogger(PersistenceLoggerImpl.class);
            
            /*
            config.setDb_type(DB_TYPE.PostgreSQL);
            config.setHost("localhost");
            config.setDatabase("doware_gcfretes");
            config.setPort(5432);
            config.setUser("doware");
            config.setPassword("FoZyrd@193Te2");
            config.setPersistenceLogger(PersistenceLoggerImpl.class);

            /*
            xK$dn,=1QtON
             */
            return factory.getSession(config);
        }
        catch (Exception ex)
        {
            PersistenceLoggerImpl logger = new PersistenceLoggerImpl();
            logger.newNofication(new PersistenceLog("SessionProvider", "Session openSession()", null, ex, ""));
        }
        return null;
    }
}
