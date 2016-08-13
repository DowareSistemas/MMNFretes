$(document).ready(function ()
{
    $('#veiculos-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
});

$('#btnPerfil').click(function ()
{
    $('#perfil-area-transportador').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
});

$('#btnVeiculos').click(function ()
{
    $('#veiculos-area-transportador').fadeIn(200);
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnEnderecos').click(function ()
{
    $('#enderecos-area-transportador').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnHistorico').click(function ()
{
    $('#historico-area-transportador').fadeIn(200);
    $('#enderecos-area-transportador').hide();
    $('#veiculos-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnPendentes').click(function ()
{
    $('#pendentes-area-transportador').fadeIn(200);
    $('#historico-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#veiculos-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});