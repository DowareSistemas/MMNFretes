var endereco_atual = 0;

$(document).ready(function ()
{
    carregaEnderecos();
    carregaEstados();
});

$('#btnAdicionar-endereco').click(function ()
{
    if ($('#formulario-endereco').attr('action') === '/gcfretes/adicionaEndereco')
        $('#txID-endereco').val(0);

    $('#formulario-endereco').ajaxForm
            ({
                success: function (data)
                {
                    $('#enderecos-items').html("");
                    $('#enderecos-items').append(data);
                    $('#formulario-endereco')[0].reset();
                    $('#btnExcluir-endereco').fadeOut(100);
                    $('#btnAdicionar-endereco').text('Adicionar');
                    $('#formulario-endereco').attr('action', '/gcfretes/adicionaEndereco');
                }
            });
});

function carregaEstados()
{
    var url = "/gcfretes/listaestados";
    $.get(url, function (estados)
    {
        for (var estado in estados)
            $('#cbUf').append(new Option(estados[estado].nome, estados[estado].id));
    });
}

$('#cbUf').change(function ()
{
    var estado_id = parseInt($('#cbUf').val());
    var url = "/gcfretes/listacidades?estado_id=" + estado_id;

    $('#cbMunicipio').empty();
    $('#cbMunicipio').append(new Option('Selecionar', '0', true, true));

    $.get(url, function (cidades)
    {
        for (var cidade in cidades)
            $('#cbMunicipio').append(new Option(cidades[cidade].nome, cidades[cidade].id));
    });
});

function carregaEnderecos()
{
    $.ajax({
        url: "/gcfretes/listaEnderecos",
        success: function (data)
        {
            $('#formulario-endereco').attr('action', '/gcfretes/adicionaEndereco');
            $('#enderecos-items').html("");
            $('#enderecos-items').append(data);
            $('#formulario-endereco')[0].reset();
            $('#btnExcluir-endereco').fadeOut(100);
        }
    });
}

$('#btnExcluir-endereco').click(function ()
{
    endereco_atual = $(this).val();
    showMsgSimNao("Deseja realmente excluir este endereço?");
});

$('#msg-sn-btnSIM').click(function ()
{
    var endereco =
            {
                endereco_id: endereco_atual
            };

    var url = "/gcfretes/inativaEndereco";
    $.post(url, endereco, function ()
    {
        $('#btnExcluir-endereco').fadeOut(100);
        $('#btnAdicionar-endereco').text('Adicionar');
        carregaEnderecos();
    });
    endereco_atual = 0;
});

function carregaEnderecoEdicao(endereco_id)
{
    $.ajax({
        url: "/gcfretes/carregaEndereco?endereco_id=" + endereco_id,
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        dataType: 'json',
        success: function (endereco)
        {
            $('#txID-endereco').val(endereco.id);
            $('#btnAdicionar-endereco').text('Salvar alterações');
            $('#formulario-endereco').attr('action', '/gcfretes/alteraEndereco');
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
            endereco_atual = endereco_id;
        }
    });
}