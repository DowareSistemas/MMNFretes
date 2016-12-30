/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import controllers.TransportadorasController;
import entidades.Transportadoras;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Marcos Vinícius
 */
public class PesquisarFretesControllerTest
{    
    @Test
    public void ListarTransportadoras()
    {
        Transportadoras transportadoras = new TransportadorasController().getByUsuario(1);
        assertEquals(transportadoras.getId(), 9);
        assertNotEquals(transportadoras.getId(), 5);
    }
}
