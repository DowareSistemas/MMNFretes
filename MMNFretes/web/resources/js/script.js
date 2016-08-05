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


$('#btnAdicionar-endereco').click(function ()
{
    $('#formulario-endereco').ajaxForm
            ({
                success: function (data)
                {
                    $('#enderecos-items').html("");
                    $('#enderecos-items').append(data);
                    $('#formulario-endereco')[0].reset();
                    $('#btnExcluir-endereco').fadeOut(100);
                    $('#btnAdicionar-endereco').text('Adicionar');
                }
            });
});

$(document).ready(function ()
{
    $('#btnExcluir').hide();
    $('#pendentes').hide();
    $('#historico').hide();
    carregaEnderecos();
});

function carregaEnderecos()
{
    $.ajax({
        url: "/MMNFretes/listaEnderecos",
        success: function (data)
        {
            $('#enderecos-items').html("");
            $('#enderecos-items').append(data);
            $('#formulario-endereco')[0].reset();
            $('#formulario-endereco').attr('action', '/MMNFretes/adicionaEndereco');
            $('#btnExcluir-endereco').fadeOut(100);
        }
    });
}

$('#btnExcluir-endereco').click(function ()
{
    var self = $(this);

    $.ajax({
        url: "/MMNFretes/inativaEndereco?endereco_id=" + self.val(),
        dataType: 'text',
        success: function (mensagem)
        {
            alert(mensagem);
            $('#btnExcluir-endereco').fadeOut(100);
            carregaEnderecos();
        }
    });

    self.val(0);
});

function carregaEnderecoEdicao(endereco_id)
{
    $.ajax({
        url: "/MMNFretes/carregaEndereco?endereco_id=" + endereco_id,
        dataType: 'json',
        success: function (endereco)
        {
            $('#btnAdicionar-endereco').text('Salvar alterações');
            $('#formulario-endereco').attr('action', '/MMNFretes/alteraEndereco?endereco_id=' + endereco_id);
            $('#btnExcluir-endereco').fadeOut(100);
            $('#txCep').val(endereco.CEP);
            $('#cbUf').val(endereco.UF);
            $('#cbMunicipio').val(endereco.municipio);
            $('#txComplemento').val(endereco.complemento);
            $('#txBairro').val(endereco.bairro);
            $('#txNumero').val(endereco.numero);
            $('#txLogradouro').val(endereco.logradouro);
            $('#btnExcluir-endereco').fadeIn(500);
            $('#btnExcluir-endereco').val(endereco_id);
        }
    });
}


$('#tela-historico').click(function ()
{
    $('#perfil').hide();
    $('#pendentes').hide();
    $('#historico').fadeIn(200);
});

$('#tela-perfil').click(function ()
{
    $('#pendentes').hide();
    $('#historico').hide();
    $('#perfil').fadeIn(200)();
});

$('#tela-pendentes').click(function ()
{
    $('#perfil').hide();
    $('#historico').hide();
    $('#pendentes').fadeIn(200);
});