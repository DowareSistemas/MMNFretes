/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author emers
 */
@Controller
public class CotacoesController 
{
 
    @RequestMapping("/pesquisar")
    public String redirect()
    {
        return "pesquisarfretes";
    }
    
}
