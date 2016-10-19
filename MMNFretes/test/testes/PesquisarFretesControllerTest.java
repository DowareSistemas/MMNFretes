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
    
    public PesquisarFretesControllerTest()
    {
    }
    
    @BeforeClass
    public static void setUpClass()
    {
    }
    
    @AfterClass
    public static void tearDownClass()
    {
    }
    
    @Before
    public void setUp()
    {
    }
    
    @After
    public void tearDown()
    {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    
    @Test
    public void ListarTransportadoras()
    {
        Transportadoras transportadoras = new TransportadorasController().getByUsuario(1);
        assertEquals(transportadoras.getId(), 1);
        assertNotEquals(transportadoras.getId(), 2);
    }
}
