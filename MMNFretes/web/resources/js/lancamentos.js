/* global AMBIENTE_ATUAL */

$(document).ready(function ()
{
    listaOportunidades();
});

function listaVeiculosSelect(categorias, carrocerias, tipos_carga)
{

}

function listaOportunidades()
{
    $('#txCep_origem').val('');
    $('#txCep_destino').val('');
    $('#txComprimento').val('');
    $('#txAltura').val('');
    $('#txLargura').val('');
    $('#txPeso').val('');
    $('#txVolumes').val('');
    $('#txObs').val('');
    $('#ckRodotrem').prop('checked', false);
    $('#ckBitrem').prop('checked', false);
    $('#ckCarrega_LS').prop('checked', false);
    $('#ckCarrega').prop('checked', false);
    $('#ckBitruck').prop('checked', false);
    $('#ckTruck').prop('checked', false);
    $('#ckToco').prop('checked', false);
    $('#ck34').prop('checked', false);
    $('#ckVLC').prop('checked', false);
    $('#ckVUC').prop('checked', false);
    $('#ckBau').prop('checked', false);
    $('#ckSider').prop('checked', false);
    $('#ckCacamba').prop('checked', false);
    $('#ckGradeBaixa').prop('checked', false);

    var url = "/" + AMBIENTE_ATUAL + "/lista-oportunidades";
    $.get(url, function (response)
    {
        $('#tabela-lancamentos').html(response);
    });
}

function carregaEnderecoByCEP(Cep, element)
{
    var url = "http://viacep.com.br/ws/" + Cep.trim() + "/json/";
    var endereco = $.get(url, function (enderecoResult)
    {
        var enderecoRetorno = "";
        enderecoRetorno += enderecoResult.logradouro + ", ";
        enderecoRetorno += enderecoResult.bairro + ", ";
        enderecoRetorno += enderecoResult.localidade + " - ";
        enderecoRetorno += enderecoResult.uf + ", ";
        enderecoRetorno += enderecoResult.cep;

        if (element !== null)
            $(element).text(enderecoRetorno);
    });
}

/*
 * 
 * @param {type} usuario_id Código do cliente a ser negociado a cotação
 * @param {type} cep_origem Cep de origem
 * @param {type} cep_destino Cep de destino
 * @param {type} veiculo_id Código do veículo
 * @param {type} valorFrete Valor do frete
 */
function aceitarOportunidade(cotacao, id_resultado)
{

    var url = "/" + AMBIENTE_ATUAL + "/aceita-oportunidade";

    $.post(url, cotacao, function (response)
    {
        if (response == '1')
        {
            $(id_resultado).fadeOut(500);
            setTimeout(
                    function ()
                    {
                        location.reload();
                    }, 3000);
        }

    });
}

function adicionaCotacao(id_lancamento)
{
    $('#modal-valor-transportador').modal('toggle');
    $('#modal-valor-transpodrador').modal('show');

    $('#btnConfirmaValor').click(function ()
    {
        var url = "/" + AMBIENTE_ATUAL + "/detalhes-oportunidade?id=" + id_lancamento;
        $.get(url, function (oportunidade)
        {
            url = "/" + AMBIENTE_ATUAL + "/infoTransportador";
            $.get(url, function (transportador)
            {
                var valor = parseFloat($('#txValor-transportador').val()).toFixed(2);
                var cotacao =
                        {
                            valor: valor,
                            status: 2,
                            cep_origem: oportunidade.cep_origem,
                            cep_destino: oportunidade.cep_destino,
                            distancia: oportunidade.distancia,
                            desconto_pendente: false,
                            desconto_bloqueado: false,
                            usuarios_id: oportunidade.usuario_id,
                            transportadoras_id: transportador.id
                        };

            });
        });
    });
}

$('#btnSalvar-lancamento').click(function ()
{
    if ($('#txCep_origem').val() === '')
    {
        showMsgOK('#msgICO');
        return;
    }

    if ($('#txCep_destino').val() === '')
    {
        showMsgOK('#msgICD');
        return;
    }

    var directionsService = new google.maps.DirectionsService();
    var request =
            {
                origin: $('#txCep_origem').val(),
                destination: $('#txCep_destino').val(),
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };

    var lancamento =
            {
                cep_origem: $('#txCep_origem').val(),
                cep_destino: $('#txCep_destino').val(),
                comprimento: $('#txComprimento').val(),
                altura: $('#txAltura').val(),
                largura: $('#txLargura').val(),
                peso: $('#txPeso').val(),
                volumes: $('#txVolumes').val(),
                observacoes: $('#txObs').val(),
                distancia: 0,
                carrocerias: getFiltroCarrocerias(),
                categorias: getFiltroCategorias()
            };

    if (lancamento.comprimento === '')
    {
        showMsgOK('#msgIC');
        return;
    }

    if (lancamento.altura === '')
    {
        showMsgOK('#msgIA');
        return;
    }

    if (lancamento.largura === '')
    {
        showMsgOK('#msgIL');
        return;
    }

    if (lancamento.volumes === '' || lancamento.volumes == '0')
    {
        showMsgOK('#msgIV');
        return;
    }

    if (lancamento.carrocerias === '')
    {
        showMsgOK('#msgSUCARR');
        return;
    }

    if (lancamento.categorias === '')
    {
        showMsgOK('#msgSUCAT');
        return;
    }

    var distancia = 0;
    directionsService.route(request, function (response, status)
    {
        if (status === google.maps.DirectionsStatus.OK)
        {
            distancia = (response.routes[0].legs[0].distance.value / 1000);
            lancamento.distancia = parseFloat(distancia).toFixed(2);

            var url = "/" + AMBIENTE_ATUAL + "/salvalancamento";
            $.post(url, lancamento, function (response)
            {
                listaOportunidades();
            });
        }
    });
});

function getFiltroCarrocerias()
{
    var retorno = "";
    /*
     *   CARROCERIAS VEICULOS
     */
    var bau = $('#ckBau').is(':checked');
    var sider = $('#ckSider').is(':checked');
    var cacamba = $('#ckCacamba').is(':checked');
    var gradeBaixa = $('#ckGradeBaixa').is(':checked');

    if (bau)
        retorno += "1;";
    if (sider)
        retorno += "2;";
    if (cacamba)
        retorno += "3;";
    if (gradeBaixa)
        retorno += "4;";

    return retorno;
}

function getFiltroCategorias()
{
    var retorno = "";

    //capturando os estados dos Checkbox's e RadioButtons da tela
    /*
     *    CATEGORIAS VEICULOS
     */
    var rodotrem = $('#ckRodotrem').is(':checked');
    var bitrem = $('#ckBitrem').is(':checked');
    var carretaLS = $('#ckCarrega_LS').is(':checked');
    var carreta = $('#ckCarreta').is(':checked');
    var bitruck = $('#ckBitruck').is(':checked');
    var truck = $('#ckTruck').is(':checked');
    var toco = $('#ckToco').is(':checked');
    var tres_quatro = $('#ck34').is(':checked');
    var VLC = $('#ckVLC').is(':checked');
    var VUC = $('#ckVUC').is(':checked');

    if (toco)
        retorno += "1;";
    if (tres_quatro)
        retorno += "2;";
    if (VLC)
        retorno += "3;";
    if (VUC)
        retorno += "4;";
    if (truck)
        retorno += "5;";
    if (bitruck)
        retorno += "6;";
    if (rodotrem)
        retorno += "7;";
    if (bitrem)
        retorno += "8;";
    if (carretaLS)
        retorno += "9;";
    if (carreta)
        retorno += "10";

    return retorno;
}