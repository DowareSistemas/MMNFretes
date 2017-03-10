/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import entidades.Transportadoras;

/**
 *
 * @author Marcos Vinícius
 */
public class TransportadorasDebito
{
    private Transportadoras transportadoras;
    private String plano;
    private double debito;
    
    public TransportadorasDebito(Transportadoras transportadoras, String plano, double debito)
    {
        this.transportadoras = transportadoras;
        this.plano = plano;
        this.debito = debito;
    }

    public Transportadoras getTransportadoras()
    {
        return transportadoras;
    }

    public void setTransportadoras(Transportadoras transportadoras)
    {
        this.transportadoras = transportadoras;
    }

    public String getPlano()
    {
        return plano;
    }

    public void setPlano(String plano)
    {
        this.plano = plano;
    }

    public double getDebito()
    {
        return debito;
    }

    public void setDebito(double debito)
    {
        this.debito = debito;
    }
    
    
}
