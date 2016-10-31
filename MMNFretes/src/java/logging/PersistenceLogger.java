/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logging;

import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.interfaces.IPersistenceLogger;
import controllers.EmailController;

/**
 *
 * @author Marcos Vinícius
 */
public class PersistenceLogger implements IPersistenceLogger
{
    @Override
    public void newNofication(PersistenceLog pl)
    {
        String msg = "Classe:    " + pl.getClassName() + "\n";
        msg +=       "Metodo:    " + pl.getMethodName() + "\n\n";
        msg +=       "Data/hora: " + pl.getDate() + "\n\n";
        msg +=       "Query:     " + pl.getQuery() + "\n\n";
        msg +=       "Descrição: " + pl.getDescription();
        EmailController.Enviar(msg);
    }
}
