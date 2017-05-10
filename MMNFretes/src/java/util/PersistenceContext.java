/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import br.com.persistor.generalClasses.EntitySet;
import br.com.persistor.interfaces.IPersistenceContext;
import entidades.Transportadoras;

/**
 *
 * @author Marcos Vinícius
 */
public class PersistenceContext implements IPersistenceContext
{

    private EntitySet<Transportadoras> transportadoras;

    public EntitySet<Transportadoras> getTransportadoras()
    {
        return transportadoras;
    }

    public void setTransportadoras(EntitySet<Transportadoras> transportadoras)
    {
        this.transportadoras = transportadoras;
    }
}
