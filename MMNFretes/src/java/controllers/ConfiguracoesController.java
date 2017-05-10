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
import entidades.Configuracoes;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
public class ConfiguracoesController
{

    @RequestMapping(value = "/autconfig", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String autentica(
            @RequestParam(value = "usuario") String usuario,
            @RequestParam(value = "senha") String senha)

    {
        return (usuario.equals("SYS") && senha.equals("gcsys")
                ? "1"
                : "0");

    }

    @RequestMapping(value = "/updateconfig", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String updateConfig(Configuracoes c)
    {
        Session session = SessionProvider.openSession();

        Configuracoes config = session.onID(Configuracoes.class, c.getId());
        config.setValor(c.getValor());

        session.update(config);
        session.commit();
        session.close();

        return (config.updated
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/config")
    public ModelAndView redirect()
    {
        Configuracoes configuracoes = new Configuracoes();
        ModelAndView mav = new ModelAndView("config");

        Session session = SessionProvider.openSession();
        session.createCriteria(configuracoes, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();

        mav.addObject("configs", configuracoes.toList());
        mav.addObject("mensagem", checkConfig());
        return mav;
    }

    @RequestMapping(value = "/descricaoconfig", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String getDescricao(@RequestParam(value = "config_id") int id)
    {
        Session session = SessionProvider.openSession();
        Configuracoes config = session.onID(Configuracoes.class, id);
        session.close();

        return config.getDescricao();
    }

    public String checkConfig()
    {
        Session session = SessionProvider.openSession();
        
        if(session.count(Configuracoes.class, "config = 'log_path'") == 0)
            session.createQuery(new Configuracoes(), "@log_path").execute();
        
        if(session.count(Configuracoes.class, "config = 'foto_path'") == 0)
            session.createQuery(new Configuracoes(), "@foto_path").execute();
        
        if(session.count(Configuracoes.class, "config = 'html_path'") == 0)
            session.createQuery(new Configuracoes(), "@html_path").execute();
        
        if(session.count(Configuracoes.class, "config = 'versao'") == 0)
            session.createQuery(new Configuracoes(), "@versao").execute();
        
        session.commit();
        session.close();
        
        return Update.check();
    }

    private List<Configuracoes> configuracoes = new ArrayList<Configuracoes>();
    
    public Configuracoes findConfig(String configNome)
    {
        for(Configuracoes c : configuracoes)
            if(c.getConfig().equals(configNome))
                return c;
        
        Configuracoes config = new Configuracoes();

        Session session = SessionProvider.openSession();
        session.createCriteria(config, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "config", configNome))
                .execute();
        session.close();
        
        configuracoes.add(config);
        
        return config;
    }
}
