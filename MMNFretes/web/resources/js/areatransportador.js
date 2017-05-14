/*
 * Variavel que determina o tipo de desconto
 *  0 - Percentual;
 *  1 - Valor;
 */
/* global parseFloat, AMBIENTE_ATUAL */

var tipo_desconto = 0;

/*Quando clicar o botao de detalhes 
 * da cotacao, vai carregar no modal
 * pelo Id e vai armazenar aqui
 */
var cotacao_atual = 0;

$(document).ready(function ()
{
    // Fake file upload
    document.getElementById('fake-file-button-browse-perfil').addEventListener('click', function ()
    {
        document.getElementById('upload-perfil').click();
    });

    document.getElementById('upload-perfil').addEventListener('change', function ()
    {
        document.getElementById('fake-file-input-name-perfil').value = this.value;
        document.getElementById('upload-perfil').removeAttribute('disabled');

        var input = this;
        if (input.files && input.files[0])
        {
            var reader = new FileReader();
            reader.onload = function (e)
            {
                $('#img-perfil').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    });

    $('#veiculos-area-transportador').hide();
    $('#enderecos').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
    $('#li-deslogado').hide();
    $('#li-logado').hide();
    $('#btnVisualizaCotacoes').hide();
    $('#btnSalvar-info').hide();

    carregaInfoTransportador();
    listarPedidosCompra();
    hab_desab_formInfo(true);
    pesquisaCotacao('');

    $.get('/' + AMBIENTE_ATUAL + '/foto_transportador', function (url)
    {
        if (url !== 'not_localized')
            $('#img-perfil').attr('src', url);
    });
});

function criarPagamentoPedido(pedido_id)
{
    var url = '/' + AMBIENTE_ATUAL + '/pagamento-pedido';
    $.get(url, {pedido_id: pedido_id}, function (response)
    {
        if (response === '0')
            return;

        document.location.href = response;
    });
}

function setStatusPedido(pedido_id, status)
{
    var params = {
        pedido_id: pedido_id,
        status: status
    };

    var url = '/' + AMBIENTE_ATUAL + '/pedidos-setstatus';
    $.post(url, params, function (result)
    {
        listarPedidosCompra();
        listarPedidosVendas();
    });
}

function listarPedidosCompra()
{
    var url = '/' + AMBIENTE_ATUAL + '/listar-pedidos';
    $.post(url, {tipo: 0}, function (content)
    {
        $('#tabela-pedidos-compra').html(content);
    });
}

function cancelaItemCotacao(id_item)
{
    showMsgSimNao('Deseja realmente remover este item da cotação?');

    $('#msg-sn-btnSIM').click(function ()
    {
        removeVeiculoCotacao(id_item);
        pesquisaCotacao();
    });
}

$('#btnDesconto').click(function ()
{
    if ($('#btnDesconto').text() === 'Voltar para detalhes')
    {
        $('#btnDesconto').text('Solicitação de desconto');
        $('#div-detalhes').show();
        $('#div-desconto').hide();
        return;
    }

    if ($('#btnDesconto').text() === 'Solicitação de desconto')
    {
        $('#btnDesconto').text('Voltar para detalhes');
        $('#div-detalhes').hide();
        $('#div-desconto').show();
        pesquisaCotacao();
        return;
    }
});

function mostraDetalhesItem(id_item)
{
    cotacao_atual = id_item;
    $('#btnConfirmaDesconto').show();
    $('#btnRecusaDesconto').show();
    $('#txValorDesconto').val(0);
    $('#lbValorFinal').text('R$ 0,00');
    $('#btnDesconto').text('Solicitação de desconto');
    $('#btnDesconto').hide();
    $('#div-desconto').hide();
    $('#div-detalhes').show();
    $('#detalhes_cotacao_transportador').modal('toggle');
    $('#detalhes_cotacao_transportador').modal('show');

    var url = "/" + AMBIENTE_ATUAL + "/getcotacao?id=" + id_item;
    $.post(url, function (cotacao)
    {
        $('#lbNomeCliente').text(cotacao.usuarios.nome);
        $('#lbNomeVeiculo').text(cotacao.veiculos.descricao);
        carregaEnderecoByCEP(cotacao.cep_origem, '#lbEndereco-origem');
        carregaEnderecoByCEP(cotacao.cep_destino, '#lbEndereco-destino');
        $('#lbDistancia').text(cotacao.distancia + " Km");
        $('#lbValorItemCotacao').text(parseFloat(cotacao.valor.toString()).toFixed(2));
        $('#lbValorAtual').text('R$ ' + parseFloat(cotacao.valor).toFixed(2));
        if (cotacao.desconto_pendente)
            $('#btnDesconto').show();
    });
}

$('#btnDescPercentual').click(function ()
{
    $('#lbTextoDesconto').text('Desconto (%):');
    tipo_desconto = 0; /* 0 - Percentual */
    calculaDesconto();
});

$('#btnDescValor').click(function ()
{
    $('#lbTextoDesconto').text('Desconto (R$):');
    tipo_desconto = 1; /* 1 - valor */
    calculaDesconto();
});

$('#txValorDesconto').keyup(function ()
{
    calculaDesconto();
});

$('#btnRecusaDesconto').click(function ()
{
    var url = "/" + AMBIENTE_ATUAL + "/reprovadesconto?cotacao_id=" + cotacao_atual;
    $.post(url, function ()
    {
        $('#btnDesconto').fadeOut(1000);
        $('#div-detalhes').show();
        $('#div-desconto').hide();
    });
});

function aprovaItemCotacao(cotacao_id)
{
    var url = "/" + AMBIENTE_ATUAL + "/aprovaitemcotacao?cotacao_id=" + cotacao_id;
    $.post(url, function (response)
    {
        pesquisaCotacao('');
    });
}

function reprovaItemCotacao(cotacao_id)
{
    var url = "/" + AMBIENTE_ATUAL + "/reprovaitemcotacao?cotacao_id=" + cotacao_id;
    $.post(url, function (response)
    {
        pesquisaCotacao('');
    });
}

$('#btnConfirmaDesconto').click(function ()
{
    $('#btnConfirmaDesconto').fadeOut(1000);
    $('#btnRecusaDesconto').fadeOut(1000);

    var tx = ($('#lbValorAtual').text().replace('R$ ', '')).trim();
    var valorAtual = parseFloat(tx);
    var valorDigitado = parseFloat($('#txValorDesconto').val());
    var valorFinal = 0;
    var desconto = '';

    if (tipo_desconto === 0) /* percentual */
    {
        valorFinal = (valorAtual - ((valorAtual / 100) * valorDigitado));
        desconto = (valorDigitado.toFixed(2) + "%");
    }

    if (tipo_desconto === 1) /* valor */
    {
        valorFinal = (valorAtual - valorDigitado);
        desconto = ("R$" + valorDigitado);
    }

    var parametros =
            {
                cotacao_id: cotacao_atual,
                valor_desconto: desconto,
                valor_final: valorFinal
            };
    var url = "/" + AMBIENTE_ATUAL + "/aprovadesconto";
    $.post(url, parametros, function (response)
    {
        $('#btnDesconto').fadeOut(1000);
        $('#div-detalhes').show();
        $('#div-desconto').hide();
        $('#lbValorItemCotacao').text(parseFloat(valorFinal).toFixed(2));
        pesquisaCotacao();
    });
});

function calculaDesconto()
{
    var tx = ($('#lbValorAtual').text().replace('R$ ', '')).trim();
    var valorAtual = parseFloat(tx);
    var valorDigitado = parseFloat($('#txValorDesconto').val());
    var valorFinal = 0;

    if (tipo_desconto === 0) /* percentual */
        valorFinal = (valorAtual - ((valorAtual / 100) * valorDigitado));

    if (tipo_desconto === 1) /* valor */
        valorFinal = (valorAtual - valorDigitado);

    $('#lbValorFinal').text(('R$: ' + parseFloat(valorFinal).toFixed(2)).replace('.', ','));
    if ($('#lbValorFinal').text().indexOf('NaN') > (-1))
        $('#lbValorFinal').text('R$: 0,00');
}

function carregaEnderecoByCEP(Cep, element)
{
    var url = "http://viacep.com.br/ws/" + Cep + "/json/";
    $.get(url, function (enderecoResult)
    {
        var enderecoRetorno = "";
        enderecoRetorno += enderecoResult.logradouro + ", ";
        enderecoRetorno += enderecoResult.bairro + " - ";
        enderecoRetorno += enderecoResult.uf + ", ";
        enderecoRetorno += enderecoResult.cep;

        $(element).text(enderecoRetorno);
    });
}

function pesquisaCotacao(termoBusca)
{
    var parametros =
            {
                query: termoBusca,
                grupo_id: 0,
                resultView: 'cotacoestransportador'
            };

    var url = '/' + AMBIENTE_ATUAL + '/buscarcotacao';
    $.post(url, parametros, function (response)
    {
        $('#tabela-cotacoes').html(response);
    });
}

$('#btnPerfil').click(function ()
{
    $('#perfil-area-transportador').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#enderecos').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
});

$('#btnVeiculos').click(function ()
{
    $('#veiculos-area-transportador').fadeIn(200);
    $('#enderecos').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
});

$('#btnEnderecos').click(function ()
{
    $('#enderecos').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
});

$('#btnHistorico').click(function ()
{
    $('#historico-area-transportador').fadeIn(200);
    $('#enderecos').hide();
    $('#veiculos-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
});

$('#btnPendentes').click(function ()
{
    $('#pendentes-area-transportador').fadeIn(200);
    $('#historico-area-transportador').hide();
    $('#enderecos').hide();
    $('#veiculos-area-transportador').hide();
    $('#perfil-area-transportador').hide();
    $('#pedidos-areatransportador').hide();
});

$('#btnPedidos').click(function ()
{
    $('#pedidos-areatransportador').fadeIn(200);
    $('#pendentes-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#enderecos').hide();
    $('#veiculos-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

function carregaInfoTransportador()
{
    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/infoTransportador",
        dataType: 'json',
        accepts: "application/json",
        success: function (transportador_result)
        {
            $('#txCPF_CNPJ').val(transportador_result.CPF_CNPJ);
            $('#txANTT').val(transportador_result.ANTT);
            $('#txWebsite').val(transportador_result.website);

            if (transportador_result.pag_seguro === true)
                $('#Pagseguro').prop('checked', true);

            if (transportador_result.negociacao_direta === true)
                $('#NegociacaoDireta').prop('checked', true);
        }
    });

    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/infoUsuario",
        dataType: 'json',
        accepts: "application/json",
        success: function (usuario_result)
        {
            $('#txNome').val(usuario_result.nome);
            $('#txTelefone1').val(usuario_result.telefone1);
            $('#txTelefone2').val(usuario_result.telefone2);
            $('#txEmail-transportador').val(usuario_result.email.toString());
            $('#txSenha-transportador').val(usuario_result.senha.toString());
        }
    });
}

$('#btnEditarInfo').click(function ()
{
    $('#btnSalvar-info').fadeIn(200);
    $('#btnEditarInfo').hide();
    hab_desab_formInfo(false);
});

$('#btnSalvar-info').click(function ()
{
    $('#alterarSenha').modal('toggle');
    $('#alterarSenha').modal('show');
});

function hab_desab_formInfo(estado)
{
    $('#txNome').prop('disabled', estado);
    $('#txEmail-transportador').prop('disabled', estado);
    $('#txSenha-transportador').prop('disabled', estado);
    $('#txTelefone1').prop('disabled', estado);
    $('#txTelefone2').prop('disabled', estado);
    $('#txCPF_CNPJ').prop('disabled', estado);
    $('#txANTT').prop('disabled', estado);
    $('#txWebsite').prop('disabled', estado);
    $('#fake-file-button-browse-perfil').prop('disabled', estado);
}

$('#btnConfirmarSenha').click(function ()
{
    var senhaDigitada = $('#txSenhaDigitada').val();
    var senha = $('#txSenha-transportador').val();

    if (senha === senhaDigitada)
    {
        $('#formulario-info-transportador').prop('action', '/' + AMBIENTE_ATUAL + '/alteraInfoTransportadora');

        $('#formulario-info-transportador').ajaxForm({
            success: function (data)
            {
                $('#form-img-perfil').attr('action', '/' + AMBIENTE_ATUAL + '/uploadimgperfil');
                uploadImgPerfil();

                carregaInfoTransportador();
                hab_desab_formInfo(true);

                $('#btnSalvar-info').hide();
                $('#btnEditarInfo').fadeIn(200);
            }
        }).submit();

    } else
    {
        $('#senhaIncorreta').modal('toggle');
        $('#senhaIncorreta').modal('show');
    }
});

function uploadImgPerfil()
{
    if ($('#fake-file-input-name-perfil').val() === '')
    {
        return;
    }

    $('#form-img-perfil').ajaxForm({
        success: function (data)
        {
            $('#upload-perfil').val(null);
        }
    }).submit();
}

$('#btnSenhaIncorreta').click(function ()
{
    hab_desab_formInfo(false);
    $('#btnSalvar-info').fadeIn(200);
    $('#alterarSenha').modal('toggle');
    $('#alterarSenha').modal('show');
});

$('#Pagseguro').change(function ()
{
    $.ajax
            ({
                url: "/" + AMBIENTE_ATUAL + "/alteraStatusPagSeguro?status=" + $('#Pagseguro').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});

$('#NegociacaoDireta').change(function ()
{
    $.ajax
            ({
                url: "/" + AMBIENTE_ATUAL + "/alteraStatusNegociacao?status=" + $('#NegociacaoDireta').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});