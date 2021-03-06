
/*
 * A variavel 'redirecionaPerfil', serve para determinar
 * se após efetuado o login, o usuário deve ser redirecionado para a 
 * sua pagina de perfil.
 * 
 * Foi criado pelo fato de mais de uma pagina utilizar essa mesma função,
 * porém, existem lugares em que o usuário deve ir para sua pagina, e outros
 * não.
 */
/* global AMBIENTE_ATUAL */

var redirecionaPerfil = false;

$(document).ready(function ()
{
    $.post("/" + AMBIENTE_ATUAL + "/usuarioatual", function (data)
    {
        if (data !== '0')
        {
            $('#li-logado').fadeIn(500);
            $('#li-deslogado').fadeOut(500);
            $('#li-sair').fadeIn(500);
            countCotacoes();
        } else
        {
            $('#li-deslogado').fadeIn(500);
            $('#li-logado').fadeOut(500);
            $('#li-sair').fadeOut(500);
        }
    });

    /*
     * Essa verificação é necessária, por que tanto a pagina de login
     * quanto a de pesquisa de fretes usam esse script. 
     * 
     * Estava ocorrendo o problema do carrinho de cotações aparecer
     * na pagina de login.
     * 
     * Então, se a url não contem o termo 'pesquisar' (presente apenas na url
     * da pagina de pesquisa), o carrinho de cotações deve ser escondido.
     */
    if (!(window.location.href.indexOf('pesquisar') > (-1)))
        $('#btnVisualizaCotacoes').hide();
});

function setRedirecionaPerfil(redireciona)
{
    redirecionaPerfil = redireciona;
}

function countCotacoes()
{
    var url = "/" + AMBIENTE_ATUAL + "/countcotacoes";
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
    $('#formulario-transportador').hide();
    $('#formulario-transportador').hide();
});

$('#mensagem').toggleClass('in');

$('#txSenha').keypress(function (e)
{
    if (e.which === 13)
        efetualLogin();
});

$('#btnLogin').click(function ()
{
    efetualLogin();
});

function efetualLogin()
{
    var usuario =
            {
                email: $('#txEmail').val(),
                senha: $('#txSenha').val()
            };
    var url = "/" + AMBIENTE_ATUAL + "/efetualogin";

    /*
     * O controller 'efetualogin', retorna o nome da pagina
     * do usuário, caso o login tenha sucesso.
     * 
     * Caso o parametro 'redireciona' seja true, o usuário é levado
     * a sua pagina de perfil.
     */
    $.post(url, usuario, function (result)
    {
        if (result === 'incorreto')
        {
            $('#senhaIncorreta').modal('toggle');
            $('#senhaIncorreta').modal('show');
        } else
        {
            usuarioLogado = true;
            if (redirecionaPerfil)
                $(location).attr('href', '/' + AMBIENTE_ATUAL + '/' + result);
            else
            {
                $('#btnVisualizaCotacoes').fadeIn(500);
                $('#li-logado').fadeIn(500);
                $('#li-deslogado').fadeOut(500);
                $('#li-sair').fadeIn(500);
                countCotacoes();
                verificaTipoUsuario();
            }
        }
    });
}
