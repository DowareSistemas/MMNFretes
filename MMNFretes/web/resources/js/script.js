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


/* $('#acao').click(function ()
 {
 $.ajax({
 url: "/MMNFretes/listaEnderecos?usuarios_id=1",
 success: function (data)
 {
 $('#tabela').append(data);
 }
 });
 });
 */


$('#btnAdicionar-endereco').click(function ()
{
    $('#formulario-endereco').ajaxForm(
            {
                success: function (data)
                {
                    $('#enderecos-items').html("");
                    $('#enderecos-items').append(data);
                    $('#formulario-endereco')[0].reset();
                }
            });

});


$(document).ready(function ()
{
    $('#btnExcluir').hide();
    carregaEnderecos();
});

function carregaEnderecos()
{
    $.ajax({
        url: "/MMNFretes/listaEnderecos",
        success: function (data)
        {
            $('#enderecos-items').append(data);
        }
    });
}

function carregaEnderecoEdicao(endereco_id)
{
    $.ajax({
        url: "/MMNFretes/carregaEndereco?endereco_id=" + endereco_id,
        dataType: 'json',
        success: function (endereco)
        {
            $('#btnExcluir').fadeOut(100);
            $('#txCep').val(endereco.CEP);
            $('#cbUf').val(endereco.UF);
            $('#txComplemento').val(endereco.complemento);
            $('#txBairro').val(endereco.bairro);
            $('#txNumero').val(endereco.numero);
            $('#txLogradouro').val(endereco.logradouro);
            $('#btnExcluir').fadeIn(500);

        }
    });
}


//$('.btnEditar').click(carregaEndereco);