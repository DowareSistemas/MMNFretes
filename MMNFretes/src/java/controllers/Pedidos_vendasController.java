/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.FILTER_TYPE;
import br.com.persistor.enums.RESULT_TYPE;
import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.generalClasses.Restrictions;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.TransactionStatus;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.service.NotificationService;
import entidades.Cotacoes;
import entidades.Pedidos_cotacoes;
import entidades.Pedidos_vendas;
import entidades.Produtos;
import entidades.Usuarios;
import enums.Ambientes;
import enums.StatusPedido;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import logging.PersistenceLoggerImpl;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sessionProvider.SessionProvider;
import util.AmbienteAtual;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class Pedidos_vendasController
{

    @RequestMapping(value = "/vincularpedido")
    public ModelAndView vincularPedido(int cotacao_id, HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Pedidos_vendas pedidos_vendas = new Pedidos_vendas();
        Session session = SessionProvider.openSession();

        Cotacoes cotacao = session.onID(Cotacoes.class, cotacao_id);
        if (cotacao.getId() == 0 || cotacao.getUsuarios_id() != usuarioLogado.getId())
        {
            session.close();
            return new ModelAndView("redirect:paginaperfil");
        }

        session.createCriteria(pedidos_vendas, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, "usuario_vendedor", usuarioLogado.getId()))
                .add(Restrictions.eq(FILTER_TYPE.AND, "status", StatusPedido.AGUARDANDO_FRETE))
                .execute();
        session.close();

        ModelAndView mav = new ModelAndView("vincularpedido");
        mav.addObject("pedidos", pedidos_vendas.toList());
        mav.addObject("cotacao_id", cotacao_id);
        return mav;
    }

    @RequestMapping(value = "/salvar-vinculo-pedido", method = RequestMethod.POST)
    public @ResponseBody
    String savarVinculoPedido(
            @RequestParam(value = "pedido_id") int pedido_id,
            @RequestParam(value = "cotacao_id") int cotacao_id,
            @RequestParam(value = "preco_frete") double preco_frete)
    {
        Session session = SessionProvider.openSession();

        Pedidos_cotacoes pc = new Pedidos_cotacoes();
        pc.setPedido_id(pedido_id);
        pc.setCotacao_id(cotacao_id);

        session.save(pc);

        Pedidos_vendas pv = session.onID(Pedidos_vendas.class, pedido_id);
        pv.setValor_frete(preco_frete);
        pv.setStatus(StatusPedido.AGUARDANDO_PAGAMENTO);

        session.update(pv);
        session.commit();
        session.close();

        return (pc.saved || pv.updated
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/criar-pedido-venda", method = RequestMethod.POST)
    public @ResponseBody
    String criarPedidoVenda(
            @RequestParam(value = "produto_id") int produto_id,
            @RequestParam(value = "quant") double quant,
            @RequestParam(value = "usuario_vendedor") int usuario_vendedor,
            @RequestParam(value = "cep_destino") String cep_destino,
            HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        int usuario_comprador = usuarioLogado.getId();

        Produtos produto = new RepresetacoesController().get(produto_id, false);
        Pedidos_vendas pedido_venda = new Pedidos_vendas();

        pedido_venda.setProduto_id(produto_id);
        pedido_venda.setValor_unit(produto.getPreco());
        pedido_venda.setQuant(quant);
        pedido_venda.setValor_final(quant * produto.getPreco());
        pedido_venda.setStatus(StatusPedido.AGUARDANDO_FRETE);
        pedido_venda.setData(Calendar.getInstance().getTime());
        pedido_venda.setUsuario_comprador(usuario_comprador);
        pedido_venda.setUsuario_vendedor(usuario_vendedor);
        pedido_venda.setCep_destino(cep_destino);

        Session session = SessionProvider.openSession();
        session.save(pedido_venda);
        session.commit();
        session.close();

        return (pedido_venda.saved
                ? "1"
                : "0");

// criarTransacaoPagSeguro(pedido_venda, usuarioLogado);
    }

    /**
     * @param tipo 0 = usuario_comprador; 1 = usuario_vendedor
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/listar-pedidos")
    public ModelAndView listarPedidos(
            @RequestParam(value = "tipo") int tipo,
            HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        Pedidos_vendas pedidos_vendas = new Pedidos_vendas();

        Session session = SessionProvider.openSession();
        session.createCriteria(pedidos_vendas, RESULT_TYPE.MULTIPLE)
                .add(Restrictions.eq(FILTER_TYPE.WHERE, (tipo == 0 ? "usuario_comprador" : "usuario_vendedor"), usuarioLogado.getId()))
                .execute();
        session.close();

        ModelAndView mav = new ModelAndView(tipo == 0 ? "listapedidos-compra" : "listapedidos-venda");
        mav.addObject("pedidos", pedidos_vendas.toList());
        return mav;
    }

    @RequestMapping(value = "/pagamento-pedido")
    public @ResponseBody
    String criarTransacaoPagSeguro(int pedido_id)
    {
        IPersistenceLogger logger = new PersistenceLoggerImpl();
        
        StringBuilder sbLog = new StringBuilder();
        sbLog.append("*** CRIAR PAGAMENTO PEDIDO *** \n");
        sbLog.append("ID PEDIDO: ").append(pedido_id).append("\n");
        
        Pedidos_vendas pedido = new Pedidos_vendas();
        String retorno = "";
        try
        {
            Session session = SessionProvider.openSession();
            pedido = session.onID(Pedidos_vendas.class, pedido_id);
            session.close();

            if (pedido.getId() == 0)
                return "0";

            sbLog.append("VALOR PEDIDO: R$ ").append(pedido.getValor_final()).append("\n");
            sbLog.append("VALOR FRETE: R$ ").append(pedido.getValor_frete()).append("\n");
            
            double totalPedidoFrete = (pedido.getValor_final() + pedido.getValor_frete());
            String valor = String.format("%.2f", totalPedidoFrete);
            valor = valor.replace(",", ".");
            
            sbLog.append("VALOR FORMATADO: R$ ").append(valor).append("\n");
            
            PaymentRequest request = new PaymentRequest();
            request.addItem(new Item(pedido.getProduto_id() + "", pedido.getProdutos().getDescricao(), 1, new BigDecimal(valor)));
            
            sbLog.append("PRODUTO: ").append(pedido.getProdutos().getDescricao()).append("\n");
            
            request.setCurrency(Currency.BRL);
            request.setSender(new Sender(pedido.getUsuarios().getNome(), pedido.getUsuarios().getEmail()));

            sbLog.append("USUARIO: ").append(pedido.getUsuarios().getNome()).append("\n");
            sbLog.append("EMAIL: ").append(pedido.getUsuarios().getEmail()).append("\n");
            
            request.setReference("PV-" + pedido.getId());
            
            sbLog.append("REF: ").append("PV-").append(pedido.getId()).append("\n");

            if (AmbienteAtual.getAmbienteAtual() == Ambientes.PRODUCAO)
                request.setNotificationURL("http://gcfretes.com.br/gcfretes/notificacaopv");
            else
                request.setNotificationURL("http://simula.gcfretes.com.br/simula_gcfretes/notificacaopv");

            retorno = request.register(new PagseguroController().getCredentials());
            
            sbLog.append("URL: ").append(retorno);
            logger.newNofication(new PersistenceLog("Pedidos_vendasController", 
                    "criarTransacaoPagSeguro",
                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()),
                    sbLog.toString(), ""));
        }
        catch (Exception ex)
        {
            Logger.getLogger(PagseguroController.class.getName()).log(Level.SEVERE, null, ex);
            logger.newNofication(
                    new PersistenceLog(getClass().getName(),
                            "criarTransacaoPagSeguro",
                            null,
                            ex,
                            "PEDIDO VENDA ID: " + pedido.getId() + "\n USUARIO COMPRADOR ID: " + pedido.getUsuario_comprador()));
            retorno = "0";
        }

        return retorno;
    }

    @RequestMapping(value = "/notificacaopv", method = RequestMethod.POST)
    public @ResponseBody
    String registraNotificacao(@RequestParam(value = "notificationCode") String nCode,
            @RequestParam(value = "notificationType") String nType)
    {
        IPersistenceLogger pLogger = new PersistenceLoggerImpl();
        try
        {
            consultaNotificacao(nCode);
        }
        catch (Exception ex)
        {
            pLogger.newNofication(
                    new PersistenceLog(
                            getClass().getName(),
                            "registraNotificacao",
                            br.com.persistor.generalClasses.Util.getDateTime(),
                            ex,
                            ""));
        }
        return "";
    }

    public void consultaNotificacao(String notificationCode) throws PagSeguroServiceException
    {
        IPersistenceLogger pLogger = new PersistenceLoggerImpl();

        Transaction transaction = NotificationService.checkTransaction(new PagseguroController().getCredentials(), notificationCode);
        int pedido_id = Integer.parseInt((transaction.getReference().split("-")[1]));

        pLogger.newNofication(new PersistenceLog(
                "Pedidos_vendasController",
                "consultaNotificacao", null,
                "NCode: " + notificationCode + "\nPedido ID: " + pedido_id, ""));

        Session session = SessionProvider.openSession();
        Pedidos_vendas pedido = session.onID(Pedidos_vendas.class, pedido_id);

        if (transaction.getStatus() == TransactionStatus.PAID)
        {
            pedido.setStatus(StatusPedido.AGUARDANDO_COLETA);
            session.update(pedido);

            /*
            EmailController emailC = EmailController.getInstance();
            emailC.clientePagouFrete(cotacao);
            emailC.instrucoesTransportador(cotacao);
             */
        }

        session.commit();
        session.close();
    }

    @RequestMapping(value = "/pedidos-setstatus", method = RequestMethod.POST)
    public @ResponseBody
    String setStatusPedido(
            @RequestParam(value = "pedido_id") int pedido_id,
            @RequestParam(value = "status") int status)
    {
        Session session = SessionProvider.openSession();
        Pedidos_vendas pedido = session.onID(Pedidos_vendas.class, pedido_id);
        pedido.setStatus(status);
        session.update(pedido);
        session.commit();
        session.close();

        return (pedido.updated
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/efetuarRepasseRepresentante")
    public @ResponseBody
    String efetuarRepasseRepresentante(@RequestParam(value = "pedido_id") int pedido_id)
    {
        Session session = SessionProvider.openSession();
        Pedidos_vendas pedido = session.onID(Pedidos_vendas.class, pedido_id);
        pedido.setStatus_repasse(1);
        session.update(pedido);
        session.commit();
        session.close();

        return (pedido.updated
                ? "1"
                : "0");
    }

    @RequestMapping(value = "/listaPedidosAdmin")
    public ModelAndView listaPedidosAdmin()
    {
        Calendar calendar = Calendar.getInstance();
        Date dataInicio = br.com.persistor.generalClasses.Util.getDate(1, calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        Date dataFim = br.com.persistor.generalClasses.Util.getDate(calendar.getActualMaximum(Calendar.DATE), calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.YEAR));
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Pedidos_vendas pedidos_vendas = new Pedidos_vendas();

        Session session = SessionProvider.openSession();
        session.createQuery(pedidos_vendas, "@listaPedidosAdmin")
                .setResult_type(RESULT_TYPE.MULTIPLE)
                .setParameter(1, dateFormat.format(dataInicio))
                .setParameter(2, dateFormat.format(dataFim))
                .execute();
        session.close();

        ModelAndView mav = new ModelAndView("listapedidos-admin");
        mav.addObject("pedidos", pedidos_vendas.toList());
        return mav;
    }
}
