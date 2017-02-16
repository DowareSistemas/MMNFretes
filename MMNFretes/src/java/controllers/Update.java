/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import br.com.persistor.generalClasses.PersistenceLog;
import br.com.persistor.interfaces.Session;
import entidades.Configuracoes;
import java.sql.PreparedStatement;
import sessionProvider.SessionProvider;

/**
 *
 * @author Marcos Vinícius
 */
public class Update
{

    public static String check()
    {
        String retorno = "";
        try
        {
            ConfiguracoesController cc = new ConfiguracoesController();

            double versao_atual = 1;

            Configuracoes c = cc.findConfig("versao");
            if (c.getValor() == null)
                versao_atual = 0;
            if (c.getValor().isEmpty())
                versao_atual = 0;

            if (versao_atual > 0)
                versao_atual = Double.parseDouble(c.getValor());

            if (versao_atual < 1.2)
                retorno = up12();
        }
        catch (Exception ex)
        {
            retorno = ex.getMessage();
        }
        return retorno;
    }

    /**
     * Versão 1.2
     */
    private static String up12() throws Exception
    {
        try
        {
            executeSql("alter table cotacoces drop column token_envio");
            executeSql("alter table cotacoes drop column token_resposta");
            executeSql("alter table historico add token_consulta varchar(50)");

            executeSql("update configuracoes set valor = '1.2' where config = 'versao'");
            return "Banco atualizado para a versão 1.2";

        }
        catch (Exception ex)
        {
            throw new Exception("Erro ao atualizar para a versão 1.2");
        }
    }

    private static void executeSql(String sql) throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            PreparedStatement ps = session.getActiveConnection().prepareStatement(sql);
            ps.execute();
            ps.close();

            session.commit();
            session.close();
        }
        catch (Exception ex)
        {
            if (session != null)
                session.close();

            session.getPersistenceLogger()
                    .newNofication(new PersistenceLog(
                            "Update",
                            "executeSql",
                            br.com.persistor.generalClasses.Util.getDateTime(),
                            "Ocorreu um problema ao atualizar o banco de dados" + sql,
                            sql));

            throw new Exception(ex.getMessage());
        }
    }
}
