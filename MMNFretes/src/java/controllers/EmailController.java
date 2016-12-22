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

/**
 *
 * @author Marcos Vinícius
 */
public class EmailController
{

    public void solicitacaoDescontoCotacao(Cotacoes cotacao, String htmlFolder)
    {
        String conteudo = "";
        String nomeArquivo = "solicitacao_desconto.html";
        try
        {
            File file = new File(htmlFolder + nomeArquivo);
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

                conteudo = conteudo.replace(
                        "{nomecliente}",
                        cotacao.getUsuarios().getNome());

                Transportadoras transp = new TransportadorasController().find(cotacao.getTransportadoras_id());
                HtmlEmail email = prepareHtmlEmail();

                email.addTo(
                        transp.getUsuarios().getEmail(),
                        transp.getNome());
                email.setHtmlMsg(conteudo);
                email.send();
            }
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
