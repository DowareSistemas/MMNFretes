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
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Address;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Shipping;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.ShippingType;
import br.com.uol.pagseguro.enums.TransactionStatus;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.service.NotificationService;
import entidades.*;
import enums.STATUS_COTACAO;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import logging.PersistenceLoggerImpl;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
@Controller
@Scope(value = "request")
public class PagseguroController
{

    private Cotacoes cotacao;
    private Enderecos endereco;
    private IPersistenceLogger logger;

    private final String EMAIL = "atendimento.doware@gmail.com";
    private final String TOKEN = "DCAB793175CF44C5B1E8DE3A798AA33B";

    public PagseguroController()
    {

    }

    @RequestMapping(value = "/processarpagamento")
    public @ResponseBody
    String processaPagamento(
            @RequestParam(value = "cotacao_id") int cotacao_id,
            Enderecos endereco)
    {
        Session session = SessionProvider.openSession();
        this.logger = session.getPersistenceLogger();
        this.cotacao = session.onID(Cotacoes.class, cotacao_id);
        this.endereco = endereco;
        session.close();
        return processar();
    }

    private Address getAddress() throws Exception
    {
        Address address = new Address();
        address.setCity(endereco.getMunicipio());
        address.setState(endereco.getUF());
        address.setStreet(endereco.getLogradouro());
        address.setNumber(endereco.getNumero() + "");
        address.setDistrict(endereco.getBairro());
        address.setPostalCode(endereco.getCEP());

        return address;
    }

    public Shipping getShipping()
    {
        Shipping shipping = new Shipping();
        try
        {
            shipping.setAddress(getAddress());
            shipping.setType(ShippingType.NOT_SPECIFIED);
            shipping.setCost(new BigDecimal(cotacao.getValor() + ""));
            return shipping;
        }
        catch (Exception ex)
        {
            Logger.getLogger(PagseguroController.class.getName()).log(Level.SEVERE, null, ex);
            logger.newNofication(new PersistenceLog(getClass().getName(), "Shipping getShipping()", null, ex, ""));
        }
        return shipping;
    }

    public String getDescription()
    {
        return ("SERVIÇOS DE FRETE/TRANSPORTE -"
                + " CEP ORIGEM: " + cotacao.getCep_origem()
                + ", CEP DESTINO: " + cotacao.getCep_destino() + ""
                + ", DISTÂNCIA: " + cotacao.getDistancia() + " Km");
    }

    private AccountCredentials getCredentials() throws PagSeguroServiceException
    {
        return new AccountCredentials(this.EMAIL, this.TOKEN);
    }

    public String processar()
    {
        String url = "";
        try
        {
            String valor = String.format("%.2f", cotacao.getValor());
            valor = valor.replace(",", ".");

            PaymentRequest pr = new PaymentRequest();
            pr.addItem(new Item("1", getDescription(), 1, new BigDecimal(valor)));
            pr.setCurrency(Currency.BRL);
            pr.setSender(new Sender(cotacao.getUsuarios().getNome(), cotacao.getUsuarios().getEmail()));
            pr.setReference("FRT-" + cotacao.getId());
          //  pr.setShipping(getShipping());
            pr.setNotificationURL("http://gcfretes.com.br/gcfretes/notificacao");
            url = pr.register(getCredentials());

            cotacao.setStatus(STATUS_COTACAO.AGUARDANDO_PAGAMENTO);
            Session session = SessionProvider.openSession();
            session.update(cotacao);
            session.commit();
            session.close();

            return url;
        }
        catch (Exception ex)
        {
            Logger.getLogger(PagseguroController.class.getName()).log(Level.SEVERE, null, ex);
            logger.newNofication(new PersistenceLog(getClass().getName(), "String processar()", null, ex, ""));
        }

        return url;
    }

    @RequestMapping(value = "/notificacao", method = RequestMethod.POST)
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
        Transaction transaction = NotificationService.checkTransaction(getCredentials(), notificationCode);
        int id_cotacao = Integer.parseInt((transaction.getReference().split("-")[1]));

        Session session = SessionProvider.openSession();
        cotacao = session.onID(Cotacoes.class, id_cotacao);

        if (transaction.getStatus() == TransactionStatus.PAID)
        {
            cotacao.setStatus(STATUS_COTACAO.AGUARDANDO_ENTREGA);
            session.update(cotacao);

            EmailController emailC = EmailController.getInstance();
            emailC.clientePagouFrete(cotacao);
            emailC.instrucoesTransportador(cotacao);

            Query q = session.createQuery(cotacao, "@deletaCotacoesRestantes");
            q.setCommit_mode(COMMIT_MODE.MANUAL);
            q.setParameter(1, cotacao.getGrupo_cotacoes_id());
            q.setParameter(2, cotacao.getId());
            q.execute();
        }
        /*

        if (transaction.getStatus() == TransactionStatus.CANCELLED)
            session.delete(cotacao);
       */
        session.commit();
        session.close();
    }
}
