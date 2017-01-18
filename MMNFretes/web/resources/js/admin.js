$(document).ready(function ()
{
    pesquisaCotacao("");
    $('#financeiro-admin').hide();
    $('#gerencia-usuarios').hide();
});

$('#btnFinanceiro').click(function ()
{
    $('#financeiro-admin').fadeIn(500);
    $('#pagamentos-admin').hide();
    $('#gerencia-usuarios').hide();
});

$('#btnPagamentos').click(function ()
{
    $('#pagamentos-admin').fadeIn(500);
    $('#gerencia-usuarios').hide();
    $('#financeiro-admin').hide();
});

$('#btnGerencia-usuarios').click(function ()
{
    $('#gerencia-usuarios').fadeIn(500);
    $('#pagamentos-admin').hide();
    $('#financeiro-admin').hide();
});

function pesquisaCotacao(termoBusca)
{
    var parametros =
            {
                query: termoBusca,
                grupo_id: 0,
                resultView: 'listapagamentos'
            };

    var url = '/gcfretes/buscarcotacao';
    $.post(url, parametros, function (response)
    {
        $('#tabela-pagamentos').html(response);
    });
}

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