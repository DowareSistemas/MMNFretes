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
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "CREATE TABLE IF NOT EXISTS oportunidades\n"
                    + "(\n"
                    + "    id             int          not null,\n"
                    + "    cep_origem     varchar(15)  not null,\n"
                    + "    cep_destino    varchar(15)  not null,\n"
                    + "    comprimento    varchar(50)  not null  default '',\n"
                    + "    altura         varchar(50)  not null  default '',\n"
                    + "    largura        varchar(50)  not null  default '',\n"
                    + "    peso           varchar(50)  not null  default '',\n"
                    + "    volumes        varchar(100) not null  default '',\n"
                    + "    observacoes    varchar(300) not null  default '',\n"
                    + "    categorias     varchar(50)  not null  default '',\n"
                    + "    carrocerias    varchar(50)  not null  default '',\n"
                    + "    rastreador     boolean      not null  default true,\n"
                    + "    pagseguro      boolean      not null  default true,\n"
                    + "    negoc_direta   boolean      not null  default true,\n"
                    + "    \n"
                    + "    primary key(id)"
                    + ")");
            
            executeSql(session, "alter table cotacoes drop column if exists token_envio");
            executeSql(session, "alter table cotacoes drop column if exists token_resposta");
            executeSql(session, "alter table historico add token_consulta varchar(50)");
            executeSql(session, "alter table cotacoes add oportunidade_id int not null default 0");
            executeSql(session, "update configuracoes set valor = '1.2' where config = 'versao'");
           
            session.commit();
            session.close();
            return "Banco atualizado para a versão 1.2";

        }
        catch (Exception ex)
        {
            if(session != null)
                session.rollback();
            
            throw new Exception("Erro ao atualizar para a versão 1.2");
        }
    }

    private static void executeSql(Session session, String sql) throws Exception
    {
        try
        {
            PreparedStatement ps = session.getActiveConnection().prepareStatement(sql);
            ps.execute();
            ps.close();
        }
        catch (Exception ex)
        {
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
