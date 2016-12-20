$(document).ready(function ()
{
    $.post("/gcfretes/usuarioatual", function (data)
    {
        if (data !== '0')
        {
            $('#li-logado').fadeIn(500);
            $('#li-deslogado').fadeOut(500);
            $('#li-sair').fadeIn(500);
            countCotacoes();
        }else
        {
            $('#li-deslogado').fadeIn(500);
            $('#li-logado').fadeOut(500);
            $('#li-sair').fadeOut(500);
        }
    });
});

function countCotacoes()
{
    var url = "/gcfretes/countcotacoes";
    $.get(url, function (response)
    {
        $('#countCotacoes').text(response);
    });
}

$('#formulario-transportador').hide();

$('#transportador').click(function ()
{
    $('#formulario-transportador').fadeIn();
    $('#formulario-usuario').hide();
});

$('#usuario').click(function ()
{
    $('#formulario-usuario').fadeIn();
    $('#formulario-transportador').hide()();
    $('#formulario-transportador').hide();
});

$('#mensagem').toggleClass('in');

function efetualLogin(redireciona)
{
    var usuario =
            {
                email: $('#txEmail').val(),
                senha: $('#txSenha').val()
            };
    var url = "/gcfretes/efetualogin";

    $.post(url, usuario, function (result)
    {
        if (result === 'incorreto')
        {
            $('#senhaIncorreta').modal('toggle');
            $('#senhaIncorreta').modal('show');
        } else
        {
            if (redireciona)
                $(location).attr('href', '/gcfretes/' + result);
            else
            {
                $('#btnVisualizaCotacoes').fadeIn(500);
                $('#li-logado').fadeIn(500);
                $('#li-deslogado').fadeOut(500);
                $('#li-sair').fadeIn(500);
                countCotacoes();
            }
        }
    });
}