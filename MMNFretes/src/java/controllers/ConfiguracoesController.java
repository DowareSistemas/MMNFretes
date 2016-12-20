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
            @RequestParam(value = "senha")String senha)
            
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
        checkConfig();

        Session session = SessionProvider.openSession();
        session.createCriteria(configuracoes, RESULT_TYPE.MULTIPLE)
                .execute();
        session.close();

        mav.addObject("configs", session.getList(configuracoes));
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

    private void checkConfig()
    {
        Session session = SessionProvider.openSession();
        if (session.count(Configuracoes.class, "") == 0)
        {
            Configuracoes config = new Configuracoes();

            config.setConfig("log_path");
            config.setDescricao("Diretório onde serão gerados os arquivos de log do sistema");

            session.save(config);

            config.setConfig("foto_path");
            config.setDescricao("Diretório onde serão armazenadas as fotos dos veículos do sistema.");

            session.save(config);
            session.commit();
        }
        session.close();
    }
    
    public Configuracoes findConfig(String config)
    {
        Configuracoes configuracoes = new Configuracoes();
        
        Session session = SessionProvider.openSession();
        session.createCriteria(configuracoes, RESULT_TYPE.UNIQUE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "config", config))
                .execute();
        session.close();
        
        return configuracoes;
    }
}
