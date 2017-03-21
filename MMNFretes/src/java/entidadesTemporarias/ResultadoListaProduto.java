/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import entidades.Produtos;

/**
 *
 * @author Marcos Vinícius
 */
public class ResultadoListaProduto
{
    private Produtos produto;
    private String foto_path;
    
    public ResultadoListaProduto(Produtos produto, String foto_path)
    {
        this.produto = produto;
        this.foto_path = foto_path;
    }

    public Produtos getProduto()
    {
        return produto;
    }

    public void setProduto(Produtos produto)
    {
        this.produto = produto;
    }

    public String getFoto_path()
    {
        return foto_path;
    }

    public void setFoto_path(String foto_path)
    {
        this.foto_path = foto_path;
    }
    
}
