/* global AMBIENTE_ATUAL */

var endereco_atual = 0;

$(document).ready(function ()
{
    carregaEnderecos();
    carregaEstados();
});

$('#btnAdicionar-endereco').click(function ()
{
    var url;

    if (endereco_atual === 0)
        url = '/' + AMBIENTE_ATUAL + '/adicionaEndereco';
    else
        url = '/' + AMBIENTE_ATUAL + '/alteraEndereco';

    var endereco = {
        id: parseInt($('#txID-endereco').val()),
        cep: $('#txCep').val(),
        uf: parseInt($('#cbUf').val()),
        municipio: parseInt($('#cbMunicipio').val()),
        bairro: $('#txBairro').val(),
        logradouro: $('#txLogradouro').val(),
        numero: $('#txNumero').val(),
        complemento: $('#txComplemento').val()
    };

    if (endereco.cep === '')
    {
        alert('Informe o CEP');
        return;
    }

    if (endereco.uf === 0)
    {
        alert('Informe a UF');
        return;
    }

    if (endereco.municipio === '')
    {
        alert('Informe o município');
        return;
    }

    if (endereco.bairro === '')
    {
        alert('Informe o bairro');
        return;
    }

    if (endereco.logradouro === '')
    {
        alert('Informe o logradouro');
        return;
    }

    $.post(url, endereco, function (data)
    {
        carregaEnderecos();
        endereco_atual = 0;
        $('#txCep').val('');
        $('#txBairro').val('');
        $('#txLogradouro').val('');
        $('#txNumero').val('0');
        $('#txComplemento').val('');
        $('#btnExcluir-endereco').fadeOut(100);
        $('#btnAdicionar-endereco').text('Adicionar');
        $('#formulario-endereco').attr('action', '/' + AMBIENTE_ATUAL + '/adicionaEndereco');
    });
});

function carregaEstados()
{
    var url = "/" + AMBIENTE_ATUAL + "/listaestados";
    $.get(url, function (estados)
    {
        for (var estado in estados)
            $('#cbUf').append(new Option(estados[estado].nome, estados[estado].id));
    });
}

$('#cbUf').change(function ()
{
    var estado_id = parseInt($('#cbUf').val());
    var url = "/" + AMBIENTE_ATUAL + "/listacidades?estado_id=" + estado_id;

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
        url: "/" + AMBIENTE_ATUAL + "/listaEnderecos",
        success: function (data)
        {
            $('#formulario-endereco').attr('action', '/' + AMBIENTE_ATUAL + '/adicionaEndereco');
            $('#enderecos-items').html("");
            $('#enderecos-items').append(data);
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

    var url = "/" + AMBIENTE_ATUAL + "/inativaEndereco";
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
        url: "/" + AMBIENTE_ATUAL + "/carregaEndereco?endereco_id=" + endereco_id,
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        dataType: 'json',
        success: function (endereco)
        {
            $('#txID-endereco').val(endereco.id);
            $('#btnAdicionar-endereco').text('Salvar alterações');
            $('#formulario-endereco').attr('action', '/' + AMBIENTE_ATUAL + '/alteraEndereco');
            $('#btnExcluir-endereco').fadeOut(100);
            $('#txCep').val(endereco.CEP);
            $('#cbUf').val(endereco.uf);

            var estado_id = parseInt($('#cbUf').val());
            var url = "/" + AMBIENTE_ATUAL + "/listacidades?estado_id=" + estado_id;

            $('#cbMunicipio').empty();
            $('#cbMunicipio').append(new Option('Selecionar', '0', true, true));

            $.get(url, function (cidades)
            {
                for (var cidade in cidades)
                    $('#cbMunicipio').append(new Option(cidades[cidade].nome, cidades[cidade].id));

                $('#cbMunicipio').val(endereco.municipio);
            });

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