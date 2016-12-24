/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.COMMIT_MODE;
import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.JOIN_TYPE;
import br.com.persistor.enums.MATCH_MODE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.ICriteria;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Query;
import com.google.gson.Gson;
import entidades.Configuracoes;
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
        cotacao.setData(br.com.persistor.generalClasses.Util.getDateFromFormat("yyyy-MM-dd"));

        Session session = SessionProvider.openSession();
        session.save(cotacao);
        session.commit();
        session.close();

        return (cotacao.saved ? "1" : "0");
    }

    @RequestMapping(value = "/listarpendentes")
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

    @RequestMapping(value = "/buscarcotacao", method = RequestMethod.POST)
    public ModelAndView buscar(
            @RequestParam(value = "query") String searchTerm,
            @RequestParam(value = "grupo_id") int grupo_id,
            @RequestParam(value = "resultView") String resultView,
            HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");

        Cotacoes cotacoes = new Cotacoes();
        Usuarios usuarios = new Usuarios();
        Transportadoras transportadoras = new Transportadoras();
        Veiculos veiculos = new Veiculos();

        Session session = SessionProvider.openSession();

        ICriteria c = session.createCriteria(cotacoes, RESULT_TYPE.MULTIPLE);
        c.add(JOIN_TYPE.INNER, transportadoras, "cotacoes.transportadoras_id = transportadoras.id");
        c.add(JOIN_TYPE.INNER, usuarios, "cotacoes.usuarios_id = usuarios.id");
        c.add(JOIN_TYPE.INNER, veiculos, "cotacoes.veiculos_id = veiculos.id");

        c.beginPrecedence();
        c.add(Restrictions.like(FILTER_TYPE.WHERE, "usuarios.nome", searchTerm, MATCH_MODE.ANYWHERE));
        c.add(Restrictions.like(FILTER_TYPE.OR, "transportadoras.nome", searchTerm, MATCH_MODE.ANYWHERE));
        c.add(Restrictions.like(FILTER_TYPE.OR, "veiculos.descricao", searchTerm, MATCH_MODE.ANYWHERE));
        c.endPrecedence();

        c.beginPrecedence();

        String[] status_cotacoes;
        if (util.Util.isUsuario(usuarioLogado))
        {
            status_cotacoes = new String[]
            {
                STATUS_COTACAO.AGUARDANDO_APROVACAO + "",
                STATUS_COTACAO.APROVADO + "",
                STATUS_COTACAO.REPROVADO + ""
            };
            c.add(Restrictions.eq(FILTER_TYPE.AND, "cotacoes.usuarios_id", usuarioLogado.getId()));
        }
        else
        {
            status_cotacoes = new String[]
            {
                STATUS_COTACAO.AGUARDANDO_APROVACAO + "",
                STATUS_COTACAO.APROVADO + ""
            };
            c.add(Restrictions.eq(FILTER_TYPE.AND, "cotacoes.transportadoras_id", new TransportadorasController().getByUsuario(usuarioLogado.getId()).getId()));
        }

        c.add(Restrictions.in(FILTER_TYPE.AND, "cotacoes.status", status_cotacoes));

        if (grupo_id > 0)
            c.add(Restrictions.eq(FILTER_TYPE.AND, "cotacoes.grupo_cotacoes_id", grupo_id));
        c.endPrecedence();

        c.execute();
        c.loadList(cotacoes);
        c.loadList(usuarios);
        c.loadList(transportadoras);
        c.loadList(veiculos);

        session.close();

        List<Cotacoes> listCotacoes = session.getList(cotacoes);
        List<Usuarios> listUsuarios = session.getList(usuarios);
        List<Transportadoras> listTransportadoras = session.getList(transportadoras);
        List<Veiculos> listVeiculos = session.getList(veiculos);

        for (int i = 0; i < listCotacoes.size(); i++)
        {
            listCotacoes.get(i).setUsuarios(listUsuarios.get(i));
            listCotacoes.get(i).setTransportadoras(listTransportadoras.get(i));
            listCotacoes.get(i).setVeiculos(listVeiculos.get(i));
        }

        ModelAndView mav = new ModelAndView(resultView);
        mav.addObject("cotacoes", listCotacoes);
        return mav;
    }

    @RequestMapping(value = "/removecotacao", method = RequestMethod.POST)
    public @ResponseBody
    String remove(@RequestParam(value = "id") int id)
    {
        Session session = SessionProvider.openSession();

        Cotacoes c = session.onID(Cotacoes.class, id);
        session.delete(c);

        /**
         * Aqui é necessário verificar se ainda existe alguma cotação
         * pertencente a este grupo. Se não houver nenhuma cotação, o grupo deve
         * ser excluido, por que na proxima vez que for adicionar uma cotação,
         * pode ser que um novo grupo seja criado, esse grupo entao vai ficar
         * "solto" no banco, ocupando espaco desnecessariamente.
         */
        if (session.count(Cotacoes.class, "grupo_cotacoes_id = " + c.getGrupo_cotacoes_id()) == 0)
        {
            Grupos_cotacoes grupo = session.onID(Grupos_cotacoes.class, c.getGrupo_cotacoes_id());
            session.delete(grupo);
        }

        session.commit();
        session.close();

        return (c.deleted
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/countcotacoes", produces = "text/plain; charset=utf-8")
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

    @RequestMapping(value = "/getcotacao", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody
    String getCotacao(@RequestParam(value = "id") int id)
    {
        Session session = SessionProvider.openSession();
        Cotacoes cotacao = session.onID(Cotacoes.class, id);
        session.close();

        return new Gson().toJson(cotacao);
    }

    @RequestMapping(value = "/listagrupos", produces = "application/json; charset=utf-8")
    public @ResponseBody
    String listGrupos(HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Grupos_cotacoes gc = new Grupos_cotacoes();

        Session session = SessionProvider.openSession();

        Query q = session.createQuery(gc, "@listaGrupos");
        q.setParameter(1, usuarioLogado.getId());
        q.execute();

        return new Gson().toJson(session.getList(gc));
    }

    @RequestMapping(value = "/upstatuscotacao")
    public @ResponseBody
    String upStatus(@RequestParam(value = "status") int status, HttpSession httpSession)
    {
        Usuarios usuario = (Usuarios) httpSession.getAttribute("usuarioLogado");
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

    @RequestMapping(value = "/solicitadesconto", method = RequestMethod.POST)
    public @ResponseBody
    String solicitaDesconto(@RequestParam(value = "cotacao_id") int cotacao_id)
    {
        Session session = SessionProvider.openSession();
        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);

        if (cotacao.isDesconto_pendente())
        {
            session.close();
            return "0";
        }

        cotacao.setDesconto_pendente(true);
        session.update(cotacao);
        session.commit();
        session.close();

        EmailController email = EmailController.getInstance();
        email.solicitacaoDescontoCotacao(cotacao);
        return "1";
    }

    @RequestMapping(value = "/aprovadesconto", method = RequestMethod.POST)
    public @ResponseBody
    String aprovaDesconto(
            @RequestParam(value = "cotacao_id") int cotacao_id,
            @RequestParam(value = "valor_desconto") String valor_desconto,
            @RequestParam(value = "valor_final") double valor_final)
    {
        Session session = SessionProvider.openSession();

        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);
        cotacao.setValor(valor_final);
        cotacao.setDesconto_pendente(false);

        session.update(cotacao);
        session.commit();
        session.close();

        if (cotacao.updated)
        {
            EmailController emailC = EmailController.getInstance();
            emailC.descontoAprovado(cotacao, valor_desconto);
            return "1";
        }
        else
            return "0";
    }

    @RequestMapping(value = "/reprovadesconto", method = RequestMethod.POST)
    public @ResponseBody
    String reprovaDesconto(@RequestParam(value = "cotacao_id") int cotacao_id)
    {
        Session session = SessionProvider.openSession();

        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);
        cotacao.setDesconto_bloqueado(true);
        cotacao.setDesconto_pendente(false);

        session.update(cotacao);
        session.commit();
        session.close();

        EmailController emailC = EmailController.getInstance();
        emailC.reprovaDesconto(cotacao);
        return "1";
    }

    @RequestMapping(value = "/aprovaitemcotacao", method = RequestMethod.POST)
    public @ResponseBody
    String aprovaItemCotacao(@RequestParam(value = "cotacao_id") int cotacao_id)
    {
        Session session = SessionProvider.openSession();

        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);
        cotacao.setStatus(STATUS_COTACAO.APROVADO);
        cotacao.setDesconto_pendente(false);
        cotacao.setDesconto_bloqueado(true);

        session.update(cotacao);
        session.commit();
        session.close();

        return "1";
    }

    @RequestMapping(value = "/reprovaitemcotacao", method = RequestMethod.POST)
    public @ResponseBody
    String reprovaItemCotacao(@RequestParam(value = "cotacao_id") int cotacao_id)
    {
        Session session = SessionProvider.openSession();

        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);
        cotacao.setStatus(STATUS_COTACAO.REPROVADO);
        cotacao.setDesconto_pendente(false);
        cotacao.setDesconto_bloqueado(true);

        session.update(cotacao);
        session.commit();
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
