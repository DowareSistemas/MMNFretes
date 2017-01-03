/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Estados;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class EstadosController
{
    @RequestMapping(value = "/listaestados", produces = "application/json; charset=utf-8")
    public @ResponseBody
    String listaEstados()
    {
        Estados estados = new Estados();
        
        Session session = SessionProvider.openSession();
        session.createCriteria(estados, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();
        
        return new Gson().toJson(session.getList(estados));
    }
}
