$(document).ready(function ()
{
    pesquisaCotacao("");
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