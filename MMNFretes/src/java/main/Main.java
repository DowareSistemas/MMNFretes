/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import br.com.uol.pagseguro.service.NotificationService;
import controllers.PagseguroController;
import java.util.Random;
import java.util.StringTokenizer;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{

    public static void main(String[] args)
    {
        try
        {
            PagseguroController pc = new PagseguroController();
            pc.consultaNotificacao("142B29-B6AB57AB57D0-9BB4509F88B8-0EC661");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
