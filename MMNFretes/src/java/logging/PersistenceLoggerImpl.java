/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logging;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.generalClasses.Util;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import controllers.ConfiguracoesController;
import controllers.EmailController;
import entidades.Configuracoes;
import java.io.*;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class PersistenceLoggerImpl implements IPersistenceLogger
{

    @Override
    public void newNofication(PersistenceLog pl)
    {
        String msg = "Classe:    " + pl.getClassName() + "\n";
        msg += "Metodo:    " + pl.getMethodName() + "\n\n";
        msg += "Data/hora: " + pl.getDate() + "\n\n";
        msg += "Query:     " + pl.getQuery() + "\n\n";
        msg += "Descrição: " + pl.getDescription();
        
        System.err.println(msg);
        FileWriter arquivo;

        try
        {
            Configuracoes config = new ConfiguracoesController().findConfig("log_path");
            
            String fileName = Util.getDateTime().replace(":", " ") + ".txt";
            
            arquivo = new FileWriter(new File(config.getValor() + fileName));
            arquivo.write(msg);
            arquivo.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
