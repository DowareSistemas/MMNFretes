/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.mail.Authenticator;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Marcos Vinícius
 */
public class EmailController
{

    public static void Enviar(String msg)
    {
        try
        {
            SimpleEmail email = new SimpleEmail();
            email.setHostName("smtp.gmail.com");// o servidor SMTP para envio do e-mail
            email.setSmtpPort(587);
            email.setTLS(true);
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
