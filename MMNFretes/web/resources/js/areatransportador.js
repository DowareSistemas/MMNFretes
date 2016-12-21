/*
 * Variavel que determina o tipo de desconto
 *  0 - Percentual;
 *  1 - Valor;
 */
/* global parseFloat */

var tipo_desconto = 0;


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
    $('#li-deslogado').hide();
    $('#li-logado').hide();
    $('#btnVisualizaCotacoes').hide();
    $('#btnSalvar-info').hide();

    carregaInfoTransportador();
    hab_desab_formInfo(true);
    pesquisaCotacao('');
});

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
        return;
    }
});

function mostraDetalhesItem(id_item)
{
    $('#btnDesconto').text('Solicitação de desconto');
    $('#btnDesconto').hide();
    $('#div-desconto').hide();
    $('#div-detalhes').show();
    $('#detalhes_cotacao_transportador').modal('toggle');
    $('#detalhes_cotacao_transportador').modal('show');

    var url = "/gcfretes/getcotacao?id=" + id_item;
    $.post(url, function (cotacao)
    {
        $('#lbNomeCliente').text(cotacao.usuarios.nome);
        $('#lbNomeVeiculo').text(cotacao.veiculos.descricao);
        carregaEnderecoByCEP(cotacao.cep_origem, '#lbEndereco-origem');
        carregaEnderecoByCEP(cotacao.cep_destino, '#lbEndereco-destino');
        $('#lbDistancia').text(cotacao.distancia + " Km");
        $('#lbValorItemCotacao').text(parseFloat(cotacao.valor.toString()).toFixed(2));

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

function calculaDesconto()
{
    var tx = ($('#lbValorAtual').text().replace('R$ ', '')).trim();
    var valorAtual = parseFloat(tx);
    var valorDigitado = parseInt($('#txValorDesconto').val());
    var valorFinal = 0;

    if (tipo_desconto === 0) /* percentual */
        valorFinal = (((valorAtual / 100) * valorDigitado) + valorAtual);

    if (tipo_desconto === 1) /* valor */
        valorFinal = (valorAtual + valorDigitado);

    $('#lbValorFinal').text(('R$: ' + parseFloat(valorFinal).toFixed(2)).replace('.', ','));
    if ($('#lbValorFinal').text().indexOf('NaN') > (-1))
        $('#lbValorFinal').text('R$: 0,00');
}

function carregaEnderecoByCEP(Cep, element)
{
    var url = "http://viacep.com.br/ws/" + Cep + "/json/";
    var endereco = $.get(url, function (enderecoResult)
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

    var url = '/gcfretes/buscarcotacao';
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
});

$('#btnVeiculos').click(function ()
{
    $('#veiculos-area-transportador').fadeIn(200);
    $('#enderecos').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnEnderecos').click(function ()
{
    $('#enderecos').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnHistorico').click(function ()
{
    $('#historico-area-transportador').fadeIn(200);
    $('#enderecos').hide();
    $('#veiculos-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnPendentes').click(function ()
{
    $('#pendentes-area-transportador').fadeIn(200);
    $('#historico-area-transportador').hide();
    $('#enderecos').hide();
    $('#veiculos-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

function carregaInfoTransportador()
{
    $.ajax({
        url: "/gcfretes/infoTransportador",
        dataType: 'json',
        accepts: "application/json",
        success: function (transportador_result)
        {
            $('#txCPF_CNPJ').val(transportador_result.CPF_CNPJ);
            $('#txANTT').val(transportador_result.ANTT);
            $('#txWebsite').val(transportador_result.website);

            if (transportador_result.cartao === true)
            {
                $('#Cartao').prop('checked', true);
            }

            if (transportador_result.boleto === true)
            {
                $('#Boleto').prop('checked', true);
            }

            if (transportador_result.negociacao_direta === true)
            {
                $('#NegociacaoDireta').prop('checked', true);
            }
        }
    });

    $.ajax({
        url: "/gcfretes/infoUsuario",
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
}

$('#btnConfirmarSenha').click(function ()
{
    var senhaDigitada = $('#txSenhaDigitada').val();
    var senha = $('#txSenha').val();

    if (senha === senhaDigitada)
    {
        $('#formulario-info-transportador').ajaxForm({
            success: function (data)
            {
                $('#form-img-perfil').attr('action', '/gcfretes/uploadimgperfil');
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

$('#Cartao').change(function ()
{
    $.ajax
            ({
                url: "/gcfretes/alteraStatusCartao?status=" + $('#Cartao').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});

$('#Boleto').change(function ()
{
    $.ajax
            ({
                url: "/gcfretes/alteraStatusBoleto?status=" + $('#Boleto').is(':checked'),
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
                url: "/gcfretes/alteraStatusNegociacao?status=" + $('#NegociacaoDireta').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});