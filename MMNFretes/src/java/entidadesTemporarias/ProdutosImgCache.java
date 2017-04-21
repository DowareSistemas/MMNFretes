/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidadesTemporarias;

import entidades.Produtos;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marcos Vinícius
 */
public class ProdutosImgCache
{

    private static ProdutosImgCache instance = null;

    public static ProdutosImgCache getInstance()
    {
        if (instance == null)
            instance = new ProdutosImgCache();

        return instance;
    }

    private List<Produtos> produtos = null;

    private ProdutosImgCache()
    {
        produtos = new ArrayList<Produtos>();
    }

    public Produtos find(int id)
    {
        for(Produtos produto : produtos)
            if(produto.getId() == id)
                return produto;
        
        return null;
    }

    public void add(Produtos produto)
    {
        produtos.add(produto);
    }

    public void remove(int id)
    {
        produtos.remove(find(id));
    }

    public void update(Produtos produto)
    {
        remove(produto.getId());
        add(produto);
    }
}
