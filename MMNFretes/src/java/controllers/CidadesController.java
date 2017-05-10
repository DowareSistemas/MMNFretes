/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.Session;
import com.google.gson.Gson;
import entidades.Cidades;
import entidades.Estados;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class CidadesController
{

    @RequestMapping(value = "/listacidades", produces = "application/json; charset=utf-8")
    public @ResponseBody
    String listaByEstado(@RequestParam(value = "estado_id") int estado_id)
    {
        Cidades cidades = new Cidades();
        Session session = SessionProvider.openSession();
        session.createCriteria(cidades, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "estado_id", estado_id))
                .execute();
        session.close();
        
        return new Gson().toJson(cidades.toList());
    }
}
