/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class ProdutosController
{
    @RequestMapping(value = "/produto")
    public String produto()
    {
        return "produto";
    }
}
