/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import controllers.RepresetacoesController;

/**
 *
 * @author Marcos Vinícius
 */
public class Main
{

    public static void main(String[] args)
    {
       RepresetacoesController rc = new RepresetacoesController();
       rc.get(1, false);
       rc.get(1, true);
       
        
        /*
        for(int i = 0; i < 1; i++)
        {
            Produtos produto = new Produtos();
            produto.setId(i);
            produto.setDescricao("Produto "+ i);
            
            ProdutosImgCache.getInstance().add(produto);
        }
        
        Produtos produto = ProdutosImgCache.getInstance().find(0);
        produto.setDescricao("Alterado");
        ProdutosImgCache.getInstance().update(produto);
        produto = ProdutosImgCache.getInstance().find(0);
        
        System.err.println(produto.getDescricao());
         */
    }
}
