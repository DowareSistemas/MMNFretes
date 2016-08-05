/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entidades.Usuarios;

/**
 *
 * @author Marcos Vinícius
 */
public class Util
{

    public static boolean isUsuario(Usuarios usuario)
    {
        if (usuario.getTipo_usuario() == 0)
        {
            return true;
        } 
        else
        {
            return false;
        }
    }
}
