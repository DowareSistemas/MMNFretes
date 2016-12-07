/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.COMMIT_MODE;
import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.ICriteria;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Query;
import entidades.Cotacoes;
import entidades.Grupos_cotacoes;
import entidades.Transportadoras;
import entidades.Usuarios;
import entidades.Veiculos;
import enums.STATUS_COTACAO;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;

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
    
    @RequestMapping(value = "/addveiculocotacao", method = RequestMethod.POST)
    public @ResponseBody
    String adicionar(Cotacoes cotacao, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        
        cotacao.setUsuarios_id(usuarioLogado.getId());
        cotacao.setGrupo_cotacoes_id(getGrupo_cotacao_em_aberto(usuarioLogado.getId()));
        
        Session session = SessionProvider.openSession();
        session.save(cotacao);
        session.commit();
        session.close();
        
        return (cotacao.saved ? "1" : "0");
    }
    
    @RequestMapping(value = "listarpendentes")
    public ModelAndView listar(HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        
        Cotacoes cotacoes = new Cotacoes();
        Veiculos veiculos = new Veiculos();
        Transportadoras transportadoras = new Transportadoras();
        
        Session session = SessionProvider.openSession();
        
        ICriteria c = session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE);
        c.add(JOIN_TYPE.INNER, veiculos, "cotacoes.veiculos_id = veiculos.id");
        c.add(JOIN_TYPE.INNER, transportadoras, "cotacoes.transportadoras_id = transportadoras.id");
        c.add(Restrictions.eq(FILTER_TYPE.WHERE, "cotacoes.usuarios_id", usuarioLogado.getId()));
        c.add(Restrictions.eq(FILTER_TYPE.AND, "status", STATUS_COTACAO.SELECIONANDO));
        c.execute();
        c.loadList(transportadoras);
        c.loadList(veiculos);
        c.loadList(cotacoes);
        session.close();
        
        List<Cotacoes> result = session.getList(cotacoes);
        
        for (int i = 0; i < result.size(); i++)
        {
            result.get(i).setTransportadoras(session.getList(transportadoras).get(i));
            result.get(i).setVeiculos(session.getList(veiculos).get(i));
        }
        
        ModelAndView mav = new ModelAndView("viewcotacoes-navbar");
        mav.addObject("cotacoes", result);
        return mav;
    }
    
    @RequestMapping(value = "removecotacao")
    public @ResponseBody
    String remove(@RequestParam(value = "id") int id)
    {
        Session session = SessionProvider.openSession();
        
        Cotacoes c = session.onID(Cotacoes.class, id);
        session.delete(c);
        
        /**
         * Aqui é necessário verificar se ainda existe 
         * alguma cotação pertencente a este grupo.
         * Se não houver nenhuma cotação,
         * o grupo deve ser excluido, por que na proxima vez
         * que for adicionar uma cotação, pode ser que um
         * novo grupo seja criado, esse grupo entao vai ficar
         * "solto" no banco, ocupando espaco desnecessariamente.
         */
        Grupos_cotacoes grupo = session.onID(Grupos_cotacoes.class, c.getGrupo_cotacoes_id());
        if (session.count(Cotacoes.class, "grupo_cotacoes_id = " + c.getGrupo_cotacoes_id()) == 0)
            session.delete(grupo);
       
        session.commit();
        session.close();
        
        return (c.deleted
                ? "1"
                : "0");
    }
    
    @RequestMapping(value = "countcotacoes", produces = "text/plain; charset=utf-8")
    public @ResponseBody
    String count(HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
        
        String whereCondition = "usuarios_id = " + usuario.getId() + " and status = 0";
        Session session = SessionProvider.openSession();
        int count = session.count(Cotacoes.class, whereCondition);
        session.close();
        
        return (count + "");
    }
    
    @RequestMapping(value = "/upstatuscotacao")
    public @ResponseBody
    String upStatus(@RequestParam(value = "status") int status, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios)httpSession.getAttribute("usuarioLogado");
        int grupo_cotacao = getGrupo_cotacao_em_aberto(usuario.getId());
        Cotacoes cotacoes = new Cotacoes();
        
        Session session = SessionProvider.openSession();
        
        Query q = session.createQuery(cotacoes, "@updateStatus");
        q.setCommit_mode(COMMIT_MODE.AUTO);
        q.setParameter(1, status);
        q.setParameter(2, grupo_cotacao);
        q.execute();
        
        session.close();
        return "1";
    }
    
    public boolean existeCotacaoComVeiculo(int id_veiculo, HttpSession httpSession)
    {
        if (httpSession == null)
            return false;
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        if (usuarioLogado == null)
            return false;
        
        Cotacoes cotacoes = new Cotacoes();
        
        Session session = SessionProvider.openSession();
        session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuarioLogado.getId()))
                .add(Restrictions.eq(FILTER_TYPE.AND, "status", STATUS_COTACAO.SELECIONANDO))
                .add(Restrictions.eq(FILTER_TYPE.AND, "veiculos_id", id_veiculo))
                .execute();
        session.close();
        
        return (!session.getList(cotacoes).isEmpty());
    }
    
    private int getGrupo_cotacao_em_aberto(int usuario_id)
    {
        Cotacoes cotacoes = new Cotacoes();
        
        Session session = SessionProvider.openSession();
        session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuarios_id", usuario_id))
                .add(Restrictions.eq(FILTER_TYPE.AND, "status", STATUS_COTACAO.SELECIONANDO))
                .execute();
        
        if (session.getList(cotacoes).isEmpty())
        {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            
            Grupos_cotacoes grupo = new Grupos_cotacoes();
            grupo.setDescricao(dateFormat.format(date));
            
            session.save(grupo);
            session.commit();
            
            grupo.setDescricao(grupo.getDescricao() + " (" + grupo.getId() + ")");
            
            session.update(grupo);
            session.commit();
            
            session.close();
            return grupo.getId();
        }
        
        session.close();
        return session.getList(cotacoes).get(0).getGrupo_cotacoes_id();
    }
}
