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
import enums.Ambientes;
import logging.PersistenceLoggerImpl;
import util.AmbienteAtual;

/**
 *
 * @author Marcos Vinícius
 */
public class SessionProvider
{

    private static SessionFactory factory = null;

    public synchronized static Session openSession()
    {
        try
        {
            if (factory != null)
                return factory.getSession();

            factory = new SessionFactory();
            DBConfig config = new DBConfig();

            switch (AmbienteAtual.getAmbienteAtual())
            {
                case Ambientes.SIMULA_ONLINE:

                    config.setDb_type(DB_TYPE.PostgreSQL);
                    config.setHost("localhost");
                    config.setDatabase("doware_simula_gcfretes");
                    config.setPort(5432);
                    config.setUser("doware");
                    config.setPassword("FoZyrd@193Te2");
                    config.setPersistenceLogger(PersistenceLoggerImpl.class);
                    break;

                case Ambientes.SIMULA_OFFLINE:

                    config.setDb_type(DB_TYPE.PostgreSQL);
                    config.setHost("localhost");
                    config.setDatabase("mmn_teste");
                    config.setPort(5432);
                    config.setUser("postgres");
                    config.setPassword("81547686");
                    config.setMaxStatements(1000);
                    config.setPersistenceLogger(PersistenceLoggerImpl.class);
                    break;

                case Ambientes.PRODUCAO:

                    config.setDb_type(DB_TYPE.PostgreSQL);
                    config.setHost("localhost");
                    config.setDatabase("doware_gcfretes");
                    config.setPort(5432);
                    config.setUser("doware");
                    config.setPassword("FoZyrd@193Te2");
                    config.setPersistenceLogger(PersistenceLoggerImpl.class);
                    break;
            }

            /*
            config.setDb_type(DB_TYPE.PostgreSQL);
            config.setHost("localhost");
            config.setDatabase("mmn_teste");
            config.setPort(5432);
            config.setUser("postgres");
            config.setPassword("81547686");
            config.setMaxStatements(1000);
            config.setPersistenceLogger(PersistenceLoggerImpl.class);
             */
 /*
            xK$dn,=1QtON
             */
            //  config.setPersistenceContext(util.PersistenceContext.class);
            config.setMaxIdleTime(5);
            config.setMaxStatements(5);
            config.setMaxIdleTimeExcessConnections(5);
            System.err.println("******** Novo Pool ********");
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
