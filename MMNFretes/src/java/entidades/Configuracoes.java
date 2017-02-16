/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import br.com.persistor.abstractClasses.Entity;
import br.com.persistor.annotations.NamedQuery;
import br.com.persistor.annotations.NamedQueryes;
import br.com.persistor.annotations.PrimaryKey;
import br.com.persistor.enums.INCREMENT;

/**
 *
 * @author Marcos Vinícius
 */
@NamedQueryes(
        value =
        {
            @NamedQuery(queryName = "log_path", queryValue = "insert into configuracoes values (1, 'log_path', 'Diretório onde serão gerados os arquivos de log do sistema')"),
            @NamedQuery(queryName = "foto_path", queryValue = "insert into configuracoes values (2, 'foto_path', 'Diretório onde serão armazenadas as fotos dos veículos do sistema')"),
            @NamedQuery(queryName = "html_path", queryValue = "insert into configuracoes values(3, 'html_path', 'Local onde serão armazenados os arquivos html a serem enviados como email')"),
            @NamedQuery(queryName = "versao", queryValue = "insert into configuracoes values(4, 'versao', 'Versão do banco de dados', '0')")
        })
public class Configuracoes extends Entity
{

    private int id;
    private String config;
    private String descricao;
    private String valor;

    @PrimaryKey(increment = INCREMENT.MANUAL)
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getConfig()
    {
        return config;
    }

    public void setConfig(String config)
    {
        this.config = config;
    }

    public String getDescricao()
    {
        return descricao;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public String getValor()
    {
        return valor;
    }

    public void setValor(String valor)
    {
        this.valor = valor;
    }

}
