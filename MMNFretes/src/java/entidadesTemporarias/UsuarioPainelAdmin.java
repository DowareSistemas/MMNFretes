/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import controllers.TransportadorasController;
import entidades.Transportadoras;
import entidades.Usuarios;

/**
 *
 * @author Marcos Vinícius
 */
public class UsuarioPainelAdmin
{

    private Transportadoras transportadora;
    private Usuarios usuario;
    private double debito;

    public UsuarioPainelAdmin(Usuarios usuario, double debito)
    {
        this.transportadora = (usuario.getTipo_usuario() == 1
                ? new TransportadorasController().getByUsuario(usuario.getId())
                : new Transportadoras());
        this.usuario = usuario;
        this.debito = debito;
    }

    public Transportadoras getTransportadora()
    {
        return transportadora;
    }

    public void setTransportadora(Transportadoras transportadora)
    {
        this.transportadora = transportadora;
    }

    public Usuarios getUsuario()
    {
        return usuario;
    }

    public void setUsuario(Usuarios usuario)
    {
        this.usuario = usuario;
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
