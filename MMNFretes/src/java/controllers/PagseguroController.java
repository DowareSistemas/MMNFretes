/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.interfaces.IPersistenceLogger;
import br.com.persistor.interfaces.Session;
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Address;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Shipping;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.ShippingType;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import entidades.*;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.context.annotation.Scope;
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
@Scope(value = "request")
public class PagseguroController
{

    private Cotacoes cotacao;
    private Enderecos endereco;
    private IPersistenceLogger logger;

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
            shipping.setCost(new BigDecimal(String.format("%.2f", cotacao.getValor())));
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
            pr.setShipping(getShipping());
            url = pr.register(new AccountCredentials("atendimento.doware@gmail.com", "DCAB793175CF44C5B1E8DE3A798AA33B"));

            return url;
        }
        catch (Exception ex)
        {
            Logger.getLogger(PagseguroController.class.getName()).log(Level.SEVERE, null, ex);
            logger.newNofication(new PersistenceLog(getClass().getName(), "String processar()", null, ex, ""));
        }

        return url;
    }
}
