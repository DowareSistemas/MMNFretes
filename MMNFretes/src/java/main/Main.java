/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import br.com.persistor.interfaces.Session;
import controllers.PagseguroController;
import entidades.Cotacoes;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{
    /*
    public static void main(String[] args)
    {
        Session session = SessionProvider.openSession();
        Cotacoes cotacao =session.onID(Cotacoes.class, 11);
        session.close();
        
        PagseguroController pgCtr = new PagseguroController(cotacao);
        pgCtr.processar();
    } */
}
