/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.enums.COMMIT_MODE;
import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import br.com.persistor.sessionManager.Query;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.TransactionStatus;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.service.NotificationService;
import entidades.Pedidos_vendas;
import entidades.Produtos;
import entidades.Usuarios;
import enums.Ambientes;
import enums.STATUS_COTACAO;
import java.math.BigDecimal;
import java.util.Calendar;
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

    @RequestMapping(value = "/criar-pedido-venda", method = RequestMethod.POST)
    public @ResponseBody
    String criarPedidoVenda(
            @RequestParam(value = "produto_id") int produto_id,
            @RequestParam(value = "quant") double quant,
            @RequestParam(value = "usuario_vendedor") int usuario_vendedor,
            HttpSession httpSession)
    {
        Usuarios usuarioLogado = (Usuarios) httpSession.getAttribute("usuarioLogado");
        int usuario_comprador = usuarioLogado.getId();

        Produtos produto = new RepresetacoesController().get(produto_id, false);
        Pedidos_vendas pedido_venda = new Pedidos_vendas();

        pedido_venda.setProduto_id(produto_id);
        pedido_venda.setValor_unit(produto.getPreco());
        pedido_venda.setQuant(quant);
        pedido_venda.setValor_unit(quant * produto.getPreco());
        pedido_venda.setPago(false);
        pedido_venda.setAtendido(false);
        pedido_venda.setData(Calendar.getInstance().getTime());
        pedido_venda.setUsuario_comprador(usuario_comprador);
        pedido_venda.setUsuario_vendedor(usuario_vendedor);

        Session session = SessionProvider.openSession();
        session.save(pedido_venda);
        session.commit();
        session.close();

        return criarTransacaoPagSeguro(pedido_venda, usuarioLogado);
    }

    private String criarTransacaoPagSeguro(Pedidos_vendas pedido, Usuarios usuarioComprador)
    {
        String retorno = "";
        try
        {
            String valor = String.format("%.2f", pedido.getValor_final());
            valor = valor.replace(",", ".");

            PaymentRequest request = new PaymentRequest();
            request.addItem(new Item(pedido.getProduto_id() + "", pedido.getProdutos().getDescricao(), 1, new BigDecimal(valor)));
            request.setCurrency(Currency.BRL);
            request.setSender(new Sender(usuarioComprador.getNome(), usuarioComprador.getEmail()));
            request.setReference("PV-" + pedido.getId());

            if (AmbienteAtual.getAmbienteAtual() == Ambientes.PRODUCAO)
                request.setNotificationURL("http://gcfretes.com.br/gcfretes/notificacaopv");
            else
                request.setNotificationURL("http://simula.gcfretes.com.br/simula_gcfretes/notificacaopv");

            retorno = request.register(new PagseguroController().getCredentials());
        }
        catch (Exception ex)
        {
            Logger.getLogger(PagseguroController.class.getName()).log(Level.SEVERE, null, ex);
            IPersistenceLogger logger = new PersistenceLoggerImpl();
            logger.newNofication(new PersistenceLog(getClass().getName(), "criarTransacaoPagSeguro", null, ex, "PEDIDO VENDA ID: " + pedido.getId() + "\n USUARIO COMPRADOR ID: " + usuarioComprador.getId()));
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
        Transaction transaction = NotificationService.checkTransaction(new PagseguroController().getCredentials(), notificationCode);
        int pedido_id = Integer.parseInt((transaction.getReference().split("-")[1]));
        
        Session session = SessionProvider.openSession();
        Pedidos_vendas pedido = session.onID(Pedidos_vendas.class, pedido_id);
        
        if (transaction.getStatus() == TransactionStatus.PAID)
        {
            pedido.setPago(true);
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
}
