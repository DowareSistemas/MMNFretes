/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.generalClasses.PersistenceLog;
import entidades.Cotacoes;
import entidades.Transportadoras;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import logging.PersistenceLoggerImpl;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;
import com.sun.mail.smtp.*;
import entidades.Usuarios;
import java.math.BigDecimal;
import java.math.MathContext;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.mail.internet.MimeBodyPart;
import org.apache.commons.mail.EmailAttachment;

/**
 *
 * @author Marcos Vinícius
 */
public class EmailController
{

    private static EmailController emailController = null;
    private String htmlFolder = "";

    private EmailController()
    {
        htmlFolder = new ConfiguracoesController().findConfig("html_path").getValor();
    }

    public static EmailController getInstance()
    {
        if (emailController == null)
            emailController = new EmailController();

        return emailController;
    }

    public void solicitacaoDescontoCotacao(Cotacoes cotacao)
    {
        String conteudo = "";
        String nomeArquivo = "solicitacao_desconto.html";

        try
        {
            conteudo = getContentFile(nomeArquivo);
            if (conteudo.isEmpty())
                return;

            conteudo = conteudo.replace("{nomecliente}", cotacao.getUsuarios().getNome());
            conteudo = conteudo.replace("{id_cotacao}", cotacao.getId() + "");

            Transportadoras transp = new TransportadorasController().find(cotacao.getTransportadoras_id());
            HtmlEmail email = prepareHtmlEmail();

            email.setSubject("Solicitação de desconto pendente");
            email.addTo(
                    transp.getUsuarios().getEmail(),
                    transp.getNome());
            email.setHtmlMsg(conteudo);
            email.send();
        }
        catch (Exception ex)
        {
            new PersistenceLoggerImpl().newNofication(new PersistenceLog(
                    "EmailController",
                    "void solicitacaoDescontoCotacao(Cotacoes cotacao, String htmlFolder)",
                    br.com.persistor.generalClasses.Util.getDateTime(),
                    br.com.persistor.generalClasses.Util.getFullStackTrace(ex),
                    ""));
        }
    }

    public void descontoAprovado(Cotacoes cotacao, String valor_desconto)
    {
        String conteudo = "";
        String nomeArquivo = "desconto_aprovado.html";

        try
        {
            conteudo = getContentFile(nomeArquivo);
            if (conteudo.isEmpty())
                return;

            conteudo = conteudo.replace("{id_cotacao}", cotacao.getId() + "");
            conteudo = conteudo.replace("{data}", new SimpleDateFormat("dd/MM/yyyy").format(cotacao.getData()));
            conteudo = conteudo.replace("{transportadora}", cotacao.getTransportadoras().getNome());
            conteudo = conteudo.replace("{valor_desconto}", valor_desconto);
            conteudo = conteudo.replace("{valor_final}", "R$" + String.format("%.2f", cotacao.getValor()));

            HtmlEmail email = prepareHtmlEmail();

            email.setSubject("Solicitação de desconto aprovada");
            email.addTo(cotacao.getUsuarios().getEmail(), cotacao.getUsuarios().getNome());
            email.setHtmlMsg(conteudo);
            email.send();
        }
        catch (Exception ex)
        {
            new PersistenceLoggerImpl().newNofication(new PersistenceLog(
                    "EmailController",
                    "void descontoAprovado(Cotacoes cotacao, String valor_desconto)",
                    br.com.persistor.generalClasses.Util.getDateTime(),
                    br.com.persistor.generalClasses.Util.getFullStackTrace(ex),
                    ""));
        }
    }

    public void reprovaDesconto(Cotacoes cotacao)
    {
        String conteudo = "";
        String nomeArquivo = "desconto_reprovado.html";

        try
        {
            conteudo = getContentFile(nomeArquivo);
            if (conteudo.isEmpty())
                return;

            conteudo = conteudo.replace("{transportadora}", cotacao.getTransportadoras().getNome());
            HtmlEmail email = prepareHtmlEmail();

            email.setSubject("Solicitação de desconto recusada");
            email.addTo(cotacao.getUsuarios().getEmail(), cotacao.getUsuarios().getNome());
            email.setHtmlMsg(conteudo);
            email.send();
        }
        catch (Exception ex)
        {
            new PersistenceLoggerImpl().newNofication(new PersistenceLog(
                    "EmailController",
                    "void reprovaDesconto(Cotacoes cotacao)",
                    br.com.persistor.generalClasses.Util.getDateTime(),
                    br.com.persistor.generalClasses.Util.getFullStackTrace(ex),
                    ""));
        }
    }

    public void clientePagouFrete(Cotacoes cotacao)
    {
        String conteudo = "";
        String nomeArquivo = "cliente_pagou.html";

        try
        {
            conteudo = getContentFile(nomeArquivo);

            conteudo = conteudo.replace("{nomecliente}", cotacao.getUsuarios().getNome());
            conteudo = conteudo.replace("{transportadora}", cotacao.getTransportadoras().getNome());
            conteudo = conteudo.replace("{id_cotacao}", cotacao.getId() + "");
            conteudo = conteudo.replace("{data}", 
                    new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime()));

            if (conteudo.isEmpty())
                return;

            Transportadoras transp = new TransportadorasController().find(cotacao.getTransportadoras_id());
            HtmlEmail email = prepareHtmlEmail();

            email.setSubject("Pagamento de transporte efetuado");
            email.addTo(
                    transp.getUsuarios().getEmail(),
                    transp.getNome());
            email.setHtmlMsg(conteudo);
            email.send();
        }
        catch (Exception ex)
        {
            new PersistenceLoggerImpl().newNofication(
                    new PersistenceLog(
                            getClass().getName(),
                            "clientePagouFrete",
                            br.com.persistor.generalClasses.Util.getDateTime(),
                            ex,
                            ""));
        }
    }

    public void instrucoesTransportador(Cotacoes cotacao)
    {
        String conteudo = "";
        String nomeArquivo = "instrucoes_transportador.html";

        try
        {
            conteudo = conteudo.replace("{nome_cliente}", cotacao.getUsuarios().getNome());

            conteudo = getContentFile(nomeArquivo);
            if (conteudo.isEmpty())
                return;

            Transportadoras transp = new TransportadorasController().find(cotacao.getTransportadoras_id());

            HtmlEmail email = prepareHtmlEmail();

            email.setSubject("Instruções");
            email.addTo(transp.getUsuarios().getEmail(),
                    transp.getNome());
            email.setHtmlMsg(conteudo);
            email.send();
        }
        catch (Exception ex)
        {
            new PersistenceLoggerImpl().newNofication(new PersistenceLog(
                    "EmailController",
                    "void instrucoesTransportador(Cotacoes cotacao)",
                    br.com.persistor.generalClasses.Util.getDateTime(),
                    br.com.persistor.generalClasses.Util.getFullStackTrace(ex),
                    ""));
        }
    }

    private String getContentFile(String fileName) throws Exception
    {
        String conteudo = "";

        File file = new File(htmlFolder + fileName);
        if (file.exists())
        {
            FileReader fr = new FileReader(file);
            BufferedReader br = new BufferedReader(fr);
            String linha = "";

            while ((linha = br.readLine()) != null)
            {
                conteudo += linha;
            }

            br.close();
            fr.close();
        }

        return conteudo;
    }

    private HtmlEmail prepareHtmlEmail() throws Exception
    {
        HtmlEmail email = new HtmlEmail();
        email.setHostName("mail.gcfretes.com.br");
        email.setSmtpPort(25);
        email.setFrom("automatico@gcfretes.com.br", "Automático - GC Fretes");
        email.setSSL(true);
        email.setTLS(true);
        email.setAuthenticator(new DefaultAuthenticator("automatico@gcfretes.com.br", "Lb6]oFD2dTH1"));
        email.embed(new File(htmlFolder + "img/gc fretes.png"), "image");

        return email;
    }

    public static void Enviar(String msg)
    {
        try
        {
            SimpleEmail email = new SimpleEmail();
            email.setHostName("smtp.gmail.com");// o servidor SMTP para envio do e-mail
            email.setSmtpPort(587);
            email.setTLS(false);
            email.setSSL(true);
            email.setAuthentication("atendimento.doware@gmail.com", "Ford1932");
            email.addTo("atendimento.doware@gmail.com", "Doware"); //destinatário
            email.setFrom("atendimento.doware@gmail.com", "Doware"); // remetente
            email.setSubject("ERRO"); // assunto do e-mail
            email.setMsg(msg); //conteudo do e-mail

            email.send(); //envia o e-mail
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
