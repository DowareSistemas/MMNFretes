/* global AMBIENTE_ATUAL */

$('#btnFinanceiro').click(function ()
{
    $('#financeiro-admin').fadeIn(500);
    $('#pagamentos-admin').hide();
    $('#gerencia-usuarios').hide();
    $('#configuracao').hide();
    $('#representantes-admin').hide();
});

$('#btnPagamentos').click(function ()
{
    $('#pagamentos-admin').fadeIn(500);
    $('#gerencia-usuarios').hide();
    $('#financeiro-admin').hide();
    $('#configuracao').hide();
    $('#representantes-admin').hide();
});

$('#btnGerencia-usuarios').click(function ()
{
    $('#gerencia-usuarios').fadeIn(500);
    $('#pagamentos-admin').hide();
    $('#financeiro-admin').hide();
    $('#configuracao').hide();
    $('#representantes-admin').hide();
});

$('#btnconfiguracao').click(function ()
{
    $('#configuracao').fadeIn(500);
    $('#pagamentos-admin').hide();
    $('#financeiro-admin').hide();
    $('#gerencia-usuarios').hide();
    $('#representantes-admin').hide();
});

$('#btnRepresentantes').click(function ()
{
    $('#representantes-admin').fadeIn(500);
    $('#configuracao').hide();
    $('#pagamentos-admin').hide();
    $('#financeiro-admin').hide();
    $('#gerencia-usuarios').hide();
});

$('#btnBusca-pagamento').click(function ()
{
    pesquisaCotacao($('#txBusca-pagamento').val());
});

$('#txBusca-pagamento').keypress(function (e)
{
    if (e.which == 13)
    {
        pesquisaCotacao($('#txBusca-pagamento').val());
    }
});

$(document).ready(function ()
{
    pesquisaCotacao("");
    $('#financeiro-admin').hide();
    $('#gerencia-usuarios').hide();
    $('#configuracao').hide();
    $('#representantes-admin').hide();

    pesquisaPagamentos('');
    listaUsuariosPainelAdmin();
    listaPedidosAdmin();
});

function pesquisaPagamentos(termoBusca)
{
    var url = '/' + AMBIENTE_ATUAL + '/listaHistoricoPaginaAdmin?searchTerm=' + termoBusca;
    $.get(url, function (content)
    {
        $('#tabela-pagamentos-admin').html(content);
    });
}

function pesquisaCotacao(termoBusca)
{
    var parametros =
            {
                query: termoBusca,
                grupo_id: 0,
                resultView: 'listapagamentos'
            };

    var url = '/' + AMBIENTE_ATUAL + '/buscarcotacao';
    $.post(url, parametros, function (response)
    {
        $('#tabela-pagamentos').html(response);
    });
}

function listaUsuariosPainelAdmin()
{
    var url = '/' + AMBIENTE_ATUAL + '/listaUsuariosAdmin';
    $.get(url, function (content)
    {
        $('#tabela-gerencia-usuarios').html(content);
    });
}

function listaPedidosAdmin()
{
    var url = '/' + AMBIENTE_ATUAL + '/listaPedidosAdmin';
    $.get(url, function (content)
    {
       $('#tabela-representantes-admin').html(content); 
    });
}

function efetuarRepasseRepresentante(pedido_id)
{
    var url = '/' + AMBIENTE_ATUAL + '/efetuarRepasseRepresentante?pedido_id=' + pedido_id;
    $.get(url, function (response)
    {
       if(response === '1') 
            listaPedidosAdmin();
    });
}

function efatuarRepasse(historico_id)
{
    var url = '/' + AMBIENTE_ATUAL + '/efetuarRepasseHistorico?historico_id=' + historico_id;
    $.get(url, function (response)
    {
        if (response === '1')
            pesquisaPagamentos('');
    });
}