/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.interfaces.Session;
import entidades.Produtos;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class ProdutosController
{
    @RequestMapping(value = "/produto", method = RequestMethod.GET)
    public ModelAndView produto(@RequestParam(value = "id") int id)
    {
        Session session = SessionProvider.openSession();
        Produtos produto = session.onID(Produtos.class, id);
        
        if(produto.getId() == 0)
            return new ModelAndView("redirect:/");
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("produto", produto);
        return mav;
    }
}
