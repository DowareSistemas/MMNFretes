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
 * @author marcosvinicius
 */
@Controller
@Scope(value = "request")
public class RepresetacoesController
{
     @RequestMapping(value = "/representacoes")
     public String redirect()
     {
         return "representacoes";
     }
}
