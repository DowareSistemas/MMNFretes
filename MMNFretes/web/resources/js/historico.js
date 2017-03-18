$(document).ready(function ()
{
    listaHistorico("");
});

function listaHistorico(termoPesquisa)
{
    var params =
            {
                searchTerm: termoPesquisa
            };
    var url = "/" + AMBIENTE_ATUAL + "/listaHistorico";

    $.post(url, params, function (response)
    {
        $('#tabela-historico').html(response);
    });
}

$('#txPesquisa-historico').keypress(function (e)
{
    if (e.which === 13)
    {
        listaHistorico($('#txPesquisa-historico').val());
    }
});

$('#btnBuscar-historico').click(function ()
{
    listaHistorico($('#txPesquisa-historico').val());
});