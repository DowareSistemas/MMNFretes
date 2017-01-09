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

            Transportadoras transp = new TransportadorasController().find(cotacao.getTransportadoras_id());
            HtmlEmail email = prepareHtmlEmail();

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

            conteudo = conteudo.replace("{transportadora}", cotacao.getTransportadoras().getNome());
            conteudo = conteudo.replace("{valor_desconto}", valor_desconto);
            conteudo = conteudo.replace("{valor_final}", "R$" + String.format("%.2f", cotacao.getValor()));

            HtmlEmail email = prepareHtmlEmail();

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
            conteudo = conteudo.replace("{cliente}", cotacao.getUsuarios().getNome());
            conteudo = conteudo.replace("{transportadora}", cotacao.getTransportadoras().getNome());
            conteudo = conteudo.replace("{id_cotacao}", cotacao.getId() + "");
            conteudo = conteudo.replace("{data}", br.com.persistor.generalClasses.Util.getDateTime());
            
            conteudo = getContentFile(nomeArquivo);
            if(conteudo.isEmpty())
                return;
            
            HtmlEmail email = prepareHtmlEmail();
            email.addTo("atendimento@gcfretes.com.br", "Equipe GC Fretes");
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
