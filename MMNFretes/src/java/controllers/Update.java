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

            if (versao_atual < 1.3)
                retorno = up13();

            if (versao_atual < 1.4)
                retorno = up14();

            if (versao_atual < 1.5)
                retorno = up15();

            if (versao_atual < 1.6)
                retorno = up16();

            if (versao_atual < 1.7)
                retorno = up17();
            
            if(versao_atual < 1.8)
                retorno = up18();
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

            executeSql(session, "CREATE TABLE oportunidades\n"
                    + "(\n"
                    + "  id integer NOT NULL,\n"
                    + "  cep_origem character varying(15) NOT NULL,\n"
                    + "  cep_destino character varying(15) NOT NULL,\n"
                    + "  comprimento character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  altura character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  largura character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  peso character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  volumes character varying(100) NOT NULL DEFAULT ''::character varying,\n"
                    + "  observacoes character varying(300) NOT NULL DEFAULT ''::character varying,\n"
                    + "  categorias character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  carrocerias character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  tipo_carga character varying(50) NOT NULL DEFAULT ''::character varying,\n"
                    + "  rastreador boolean NOT NULL DEFAULT true,\n"
                    + "  pagseguro boolean NOT NULL DEFAULT true,\n"
                    + "  negoc_direta boolean NOT NULL DEFAULT true,\n"
                    + "  usuario_id integer,\n"
                    + "  distancia double precision,\n"
                    + "  CONSTRAINT oportunidades_pkey PRIMARY KEY (id),\n"
                    + "  CONSTRAINT oportunidades_usuario_id_fkey FOREIGN KEY (usuario_id)\n"
                    + "      REFERENCES usuarios (id) MATCH SIMPLE\n"
                    + "      ON UPDATE NO ACTION ON DELETE NO ACTION\n"
                    + ")\n"
                    + "WITH (\n"
                    + "  OIDS=FALSE\n"
                    + ");");

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
            if (session != null)
                session.rollback();

            throw new Exception("Erro ao atualizar para a versão 1.2");
        }
    }

    //Versão 1.3
    private static String up13() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "alter table oportunidades rename column usuario_id to usuarios_id");
            executeSql(session, "update configuracoes set valor = '1.3' where config = 'versao'");

            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.3";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }
            throw new Exception("Erro ao atualizar para a versão 1.3");
        }
    }

    //Versao 1.4
    private static String up14() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "alter table transportadoras add modelo_pagamento int not null default 0");
            executeSql(session, "insert into configuracoes values (5, 'percentual_participativo', 'Porcentagem do plano participativo', '5')");
            executeSql(session, "insert into configuracoes values (6, 'valor_mensal', 'Valor (R$) do plano mensal', '99')");
            executeSql(session, "update configuracoes set valor = '1.4' where config = 'versao'");

            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.4";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }

            throw new Exception("Erro ao atualizar para a versão 1.4");
        }
    }

    //Versao 1.5
    private static String up15() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "create table produtos\n"
                    + "( \n"
                    + "    id         int                    not null,\n"
                    + "    nome       varchar(100)           not null,\n"
                    + "    descricao  varchar(5000)          not null,\n"
                    + "    tipo       int                    not null default 0,\n"
                    + "    preco      numeric(10,2)	     not null default 0.00,\n"
                    + "    usuario_id int                    not null,\n"
                    + "     foto       BYTEA                  null, \n"
                    + "\n"
                    + "    primary key(id),\n"
                    + "    foreign key (usuario_id) references Usuarios(id)\n"
                    + ")");

            executeSql(session, "update configuracoes set valor = '1.5' where config = 'versao'");
            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.5";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }

            throw new Exception("Erro ao atualizar para a versão 1.5");
        }
    }

    //versao 1.6
    private static String up16() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "alter table produtos add unidade varchar(5) not null default 'UN'");
            executeSql(session, "create table pedidos_vendas\n"
                    + "(\n"
                    + "    id                   int            not null,\n"
                    + "    produto_id           int            not null,\n"
                    + "    valor_unit           numeric(10,2)  not null,\n"
                    + "    quant                numeric(10,2)  not null default 1,\n"
                    + "    valor_final          numeric(10,2)  not null,\n"
                    + "    usuario_comprador    int  		 not null,\n"
                    + "    usuario_vendedor     int  	 	 not null,\n"
                    + "    data                 date           not null,\n"
                    + "    atendido             boolean        not null default false,\n"
                    + "    pago                 boolean        not null default false,\n"
                    + "    \n"
                    + "    primary key(id),\n"
                    + "    foreign key(produto_id)        references produtos (id),\n"
                    + "    foreign key(usuario_comprador) references usuarios (id),\n"
                    + "    foreign key(usuario_vendedor)  references usuarios (id)\n"
                    + ")");
            executeSql(session, "update configuracoes set valor = '1.6' where config = 'versao'");
            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.6";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }

            throw new Exception("Erro ao atualizar para a versão 1.6");
        }
    }

    //versao 1.7
    private static String up17() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();

            executeSql(session, "create table pedidos_cotacoes\n"
                    + "(\n"
                    + "    id          int not null,\n"
                    + "    cotacao_id  int not null,\n"
                    + "    pedido_id   int not null,\n"
                    + "\n"
                    + "    primary key(id),\n"
                    + "    foreign key(cotacao_id) references cotacoes (id),\n"
                    + "    foreign key(pedido_id)  references pedidos_vendas(id)  \n"
                    + ")");
            executeSql(session, "alter table pedidos_vendas add valor_frete numeric(10,2) not null default 0");
            executeSql(session, "alter table pedidos_vendas add cep_destino varchar(20) not null");
            executeSql(session, "alter table pedidos_vendas drop atendido");
            executeSql(session, "alter table pedidos_vendas drop pago");
            executeSql(session, "alter table pedidos_vendas add status int not null default 0");
            executeSql(session, "alter table historico add status_repasse int not null default 0");
            executeSql(session, "alter table pedidos_vendas add status_repasse int not null default 0");
            executeSql(session, "update configuracoes set valor = '1.7' where config = 'versao'");
            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.7";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }

            throw new Exception("Erro ao atualizar para a versão 1.7");
        }
    }

    //versao 1.8
    private static String up18() throws Exception
    {
        Session session = null;
        try
        {
            session = SessionProvider.openSession();
            executeSql(session, "alter table produtos add quant numeric(10,2) not null default 0");
            executeSql(session, "update configuracoes set valor = '1.8' where config = 'versao'");
            session.commit();
            session.close();

            return "Banco atualizado para a versão 1.8";
        }
        catch (Exception ex)
        {
            if (session != null)
            {
                session.rollback();
                session.close();
            }

            throw new Exception("Erro ao atualizar para a versão 1.8");
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
