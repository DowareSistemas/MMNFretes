var modoEdicaoInfo = false;
var cotacao_atual = 0;
var cep_origem = '';
var cep_destino = '';

var enderecoObj =
        {
            CEP: '',
            logradouro: '',
            bairro: '',
            municipio: '',
            UF: '',
            numero: '',
            complemento: ''
        };

$(document).ready(function ()
{
    $('#btnExcluir').hide();
    $('#pendentes').hide();
    $('#historico').hide();
    $('#enderecos').hide();
    $('#btnSalvar-info').hide();
    $('#btnEditar-grupo').hide();
    $('#li-deslogado').hide();
    $('#li-logado').hide();
    $('#btnVisualizaCotacoes').hide();
    $('#lancamentos').hide();

    carregaInfoUsuario();
    hab_desab_formInfo(true);
    listaGruposCotacoes();
    $('#lbToken_autorizacao').css('color', 'green');
    $('#lbMensagemValidacaoToken').hide();
    $('#lbToken_autorizacao').hide();
});

function showConfirmaRecebmento(id_cotacao)
{
    cotacao_atual = id_cotacao;

    $.post("/gcfretes/gera-token-historico", function (token)
    {
        $('#token_consulta').text(token);
    });

    $('#txComentario').val('');

    $('#modal-avaliacao').modal('toggle');
    $('#modal-avaliacao').modal('show');
}

$('#btnEncerraCotacao').click(function ()
{
    var params =
            {
                cotacao_id: cotacao_atual,
                token: $('#token_consulta').text(),
                estrelas: estrelas,
                comentario: $('#txComentario').val()
            };

    var url = "/gcfretes/encerraCotacao";
    $.post(url, params, function (response)
    {
        $('#cbGrupos').empty();
        $('#tabela-cotacoes-usuario').html('');
        listaHistorico("");
        listaGruposCotacoes();
    });

});

$('#btnFechaModalAvaliacao').click(function ()
{
    $('#modal-avaliacao').modal('hide');
});

function carregaInfoUsuario()
{
    $.ajax({
        url: "/gcfretes/infoUsuario",
        dataType: 'json',
        accepts: "application/json",
        success: function (usuario)
        {
            $('#txNome-usuario').val(usuario.nome);
            $('#txEmail-usuario').val(usuario.email);
            $('#txSenha-usuario').val(usuario.senha);
            $('#txConfirm-senha').val(usuario.senha);
            $('#txTelefone1').val(usuario.telefone1);
            $('#txTelefone2').val(usuario.telefone2);
        }
    });
}

$('#cbGrupos').change(function ()
{
    var itemCb = $(this);
    listaCotacoes(itemCb.val());
});

$('#btnSolicitarDesconto').click(function ()
{
    $('#btnSolicitarDesconto').fadeOut(600);

    var self = $(this);
    var url = "/gcfretes/solicitadesconto?cotacao_id=" + self.val();
    $.post(url, function (response)
    {
    });
});

$('#btnGerarBoleto').click(function ()
{
    carregaEnderecoByCEP(cep_origem, null);

    var params =
            {
                cotacao_id: cotacao_atual,
                CEP: enderecoObj.CEP,
                logradouro: enderecoObj.logradouro,
                bairro: enderecoObj.bairro,
                municipio: enderecoObj.municipio,
                UF: enderecoObj.UF
            };
    var url = "/gcfretes/processarpagamento";

    $.post(url, params, function (data)
    {
        window.location.href = data;
    });
});

function mostraDetalhesItem(id_item)
{
    $('#btnSolicitarDesconto').hide();
    $('#btnGerarBoleto').hide();

    $('#detalhes_cotacao').modal('toggle');
    $('#detalhes_cotacao').modal('show');

    var url = "/gcfretes/getcotacao?id=" + id_item;
    $.post(url, function (cotacao)
    {
        $('#lbNomeTransportador').text(cotacao.transportadoras.nome);
        $('#lbNomeVeiculo').text(cotacao.veiculos.descricao);
        carregaEnderecoByCEP(cotacao.cep_origem, '#lbEndereco-origem');
        carregaEnderecoByCEP(cotacao.cep_destino, '#lbEndereco-destino');
        $('#lbDistancia').text(cotacao.distancia + " Km");
        $('#lbValorItemCotacao').text(parseFloat(cotacao.valor.toString()).toFixed(2));
        $('#btnSolicitarDesconto').val(id_item);

        if (cotacao.status === 1)
            if (!cotacao.desconto_pendente)
                if (!cotacao.desconto_bloqueado)
                    $('#btnSolicitarDesconto').show();

        if (cotacao.status === 2)
            $('#btnGerarBoleto').show();

        cotacao_atual = id_item;
        cep_origem = cotacao.cep_origem;
        cep_destino = cotacao.cep_destino;
    });
}

function carregaEnderecoByCEP(Cep, element)
{
    var url = "http://viacep.com.br/ws/" + Cep + "/json/";
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
        fillEnderecoObj(enderecoResult);
    });
}

function fillEnderecoObj(enderecoResult)
{
    enderecoObj.CEP = enderecoResult.cep;
    enderecoObj.logradouro = enderecoResult.logradouro;
    enderecoObj.bairro = enderecoResult.bairro;
    enderecoObj.UF = enderecoResult.uf;
    enderecoObj.municipio = enderecoResult.localidade;
}

function cancelaItemCotacao(id_item)
{
    showMsgSimNao('Deseja realmente remover este item da cotação?');

    $('#msg-sn-btnSIM').click(function ()
    {
        var cotacao =
                {
                    id: id_item
                };
        var url = "/gcfretes/removecotacao";
        $.post(url, cotacao, function (respose)
        {
            if (respose === '1')
                listaCotacoes($('#cbGrupos').val());
        });
    });
}

function listaCotacoes(grupo_id)
{
    var parametros =
            {
                query: "",
                grupo_id: grupo_id,
                resultView: "cotacoesusuario"
            };

    var url = "/gcfretes/buscarcotacao";
    $.post(url, parametros, function (result)
    {
        $('#tabela-cotacoes-usuario').html(result);
    });
}

function listaGruposCotacoes()
{
    $.get("/gcfretes/listagrupos", function (grupos)
    {
        var isFirst = true;
        for (var grupo in grupos)
        {
            $('#cbGrupos').append(new Option(grupos[grupo].descricao, grupos[grupo].id));

            if (isFirst)
                listaCotacoes(grupos[grupo].id);
            isFirst = false;
        }
    });
}

$('#cbGrupos').change(function ()
{
    $('#btnEditar-grupo').fadeIn(200);
});

$('#btnEditar-grupo').click(function ()
{
    $('#editar-grupo').modal('toggle');
    $('#editar-grupo').modal('show');

    $('#txNomeGrupo').val($('#cbGrupos').val());
});

function hab_desab_formInfo(estado)
{
    $('#txNome-usuario').prop('disabled', estado);
    $('#txEmail-usuario').prop('disabled', estado);
    $('#txSenha-usuario').prop('disabled', estado);
    $('#txConfirm-senha').prop('disabled', estado);
    $('#txTelefone1').prop('disabled', estado);
    $('#txTelefone2').prop('disabled', estado);
}

$('#btnAlterar-info').click(function ()
{
    $('#btnAlterar-info').hide();
    $('#btnSalvar-info').fadeIn();
    hab_desab_formInfo(false);
});

$('#btnConfirmarSenha').click(function ()
{
    var senha = $('#txSenha-usuario').val();
    var senhaConfirmada = $('#txSenhaConfirmada').val();

    if (senha === senhaConfirmada)
    {
        $('#formulario-info-usuario').ajaxForm({
            success: function ()
            {
                hab_desab_formInfo(true);
                carregaInfoUsuario();
                $('#btnAlterar-info').fadeIn();
                $('#btnSalvar-info').hide();
            }

        }).submit();

    } else
    {
        $('#senhaIncorreta').modal('toggle');
        $('#senhaIncorreta').modal('show');
    }
});

$('#btnSenhaIncorreta').click(function ()
{
    $('#mensagem-input').modal('toggle');
    $('#mensagem-input').modal('show');
});

$('#tela-enderecos').click(function ()
{
    $('#enderecos').fadeIn(200);
    $('#historico').hide();
    $('#perfil').hide();
    $('#pendentes').hide();
    $('#lancamentos').hide();
});

$('#tela-historico').click(function ()
{
    $('#historico').fadeIn(200);
    $('#enderecos').hide();
    $('#perfil').hide();
    $('#pendentes').hide();
    $('#lancamentos').hide();
});

$('#tela-perfil').click(function ()
{
    $('#perfil').fadeIn(200);
    $('#enderecos').hide();
    $('#pendentes').hide();
    $('#historico').hide();
    $('#lancamentos').hide();
});

$('#tela-pendentes').click(function ()
{
    $('#pendentes').fadeIn(200);
    $('#enderecos').hide();
    $('#historico').hide();
    $('#perfil').hide();
    $('#lancamentos').hide();
});

$('#tela-lancamentos').click(function ()
{
    $('#pendentes').hide();
    $('#enderecos').hide();
    $('#perfil').hide();
    $('#historico').hide();
    $('#lancamentos').fadeIn(200);
});
