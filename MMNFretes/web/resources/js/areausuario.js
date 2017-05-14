/* global AMBIENTE_ATUAL */

var modoEdicaoInfo = false;
var cotacao_atual = 0;
var cep_origem = '';
var cep_destino = '';

var enderecoObj = {
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
    $('#btnSalvar-info').hide();
    $('#btnEditar-grupo').hide();
    $('#li-deslogado').hide();
    $('#li-logado').hide();
    $('#btnVisualizaCotacoes').hide();

    carregaInfoUsuario();
    hab_desab_formInfo(true);
    listaGruposCotacoes();

    $('#lbToken_autorizacao').css('color', 'green');
    $('#lbMensagemValidacaoToken').hide();
    $('#lbToken_autorizacao').hide();
});

function removerLancamento(id_lancamento)
{
    var url = '/' + AMBIENTE_ATUAL + '/remove-oportunidade?id=' + id_lancamento;
    $.get(url, function (response)
    {
        if (response === '1')
            listaOportunidades();
    });
}

function redirectVincularPedidos(id_cotacao)
{
    var url = '/' + AMBIENTE_ATUAL + '/vincularpedido?cotacao_id=' + id_cotacao;
    window.location.href = url;
}

function showConfirmaRecebmento(id_cotacao)
{
    cotacao_atual = id_cotacao;

    $.post("/" + AMBIENTE_ATUAL + "/gera-token-historico", function (token)
    {
        $('#token_consulta').text(token);
    });

    $('#txComentario').val('');

    $('#modal-avaliacao').modal('toggle');
    $('#modal-avaliacao').modal('show');
}

$('#btnEncerraCotacao').click(function ()
{
    var params = {
        cotacao_id: cotacao_atual,
        token: $('#token_consulta').text(),
        estrelas: estrelas,
        comentario: $('#txComentario').val()
    };

    var url = "/" + AMBIENTE_ATUAL + "/encerraCotacao";
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
        url: "/" + AMBIENTE_ATUAL + "/infoUsuario",
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
    var url = "/" + AMBIENTE_ATUAL + "/solicitadesconto?cotacao_id=" + self.val();
    $.post(url, function (response)
    {
    });
});

//Gerar pagamento
$('#btnGerarBoleto').click(function ()
{
    carregaEnderecoByCEPAreaUsuario(cep_origem, null);

    var params =
            {
                cotacao_id: cotacao_atual,
                cep: enderecoObj.CEP,
                logradouro: enderecoObj.logradouro,
                bairro: enderecoObj.bairro,
                municipio: enderecoObj.municipio,
                uf: enderecoObj.UF
            };
    var url = "/" + AMBIENTE_ATUAL + "/processarpagamento";

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

    var url = "/" + AMBIENTE_ATUAL + "/getcotacao?id=" + id_item;
    $.post(url, function (cotacao)
    {
        $('#lbNomeTransportador').text(cotacao.transportadoras.nome);
        $('#lbNomeVeiculo').text(cotacao.veiculos.descricao);
        carregaEnderecoByCEPAreaUsuario(cotacao.cep_origem, '#lbEndereco-origem');
        carregaEnderecoByCEPAreaUsuario(cotacao.cep_destino, '#lbEndereco-destino');
        $('#lbDistancia').text(cotacao.distancia + " Km");
        $('#lbValorItemCotacao').text(parseFloat(cotacao.valor.toString()).toFixed(2));
        $('#btnSolicitarDesconto').val(id_item);

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

function carregaEnderecoByCEPAreaUsuario(Cep, element)
{
    var url = "http://viacep.com.br/ws/" + Cep + "/json/";

    $.ajax({
        url: url,
        async: false,
        success: function (enderecoResult)
        {
            var enderecoRetorno = "";
            enderecoRetorno += enderecoResult.logradouro + ", ";
            enderecoRetorno += enderecoResult.bairro + ", ";
            enderecoRetorno += enderecoResult.localidade + " - ";
            enderecoRetorno += enderecoResult.uf + ", ";
            enderecoRetorno += enderecoResult.cep;

            if (element !== null)
                $(element).text(enderecoRetorno);
            fillEnderecoObjAreaUsuario(enderecoResult);
        }
    });
}

function fillEnderecoObjAreaUsuario(enderecoResult)
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
        var url = "/" + AMBIENTE_ATUAL + "/removecotacao";
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

    var url = "/" + AMBIENTE_ATUAL + "/buscarcotacao";
    $.post(url, parametros, function (result)
    {
        $('#tabela-cotacoes-usuario').html(result);
    });
}

function listaGruposCotacoes()
{
    $('#cbGrupos').empty();
    $.get("/" + AMBIENTE_ATUAL + "/listagrupos", function (grupos)
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

$('#btnRenomearGrupo').click(function ()
{
    $('#editar-grupo').modal('toggle');
    $('#editar-grupo').modal('show');

    $('#btnSalvaGrupo').click(function ()
    {
        if ($('#txNomeGrupo').val() === '')
            return;

        var params =
                {
                    id_grupo: $('#cbGrupos').val(),
                    novo_nome: $('#txNomeGrupo').val()
                };

        var url = '/' + AMBIENTE_ATUAL + '/renomear-grupo';
        $.post(url, params, function (response)
        {
            listaGruposCotacoes();
        });
    });
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
        $('#formulario-info-usuario').prop('action', '/' + AMBIENTE_ATUAL + '/alteraInfoUsuario');
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

/* DINAMICA ANTIGA
 
 $('#tela-enderecos').click(function ()
 {
 $('#enderecos').fadeIn(200);
 $('#historico').hide();
 $('#perfil').hide();
 $('#pendentes').hide();
 $('#lancamentos').hide();
 $('#representacoes').hide();
 });
 
 $('#tela-historico').click(function ()
 {
 $('#enderecos').hide();
 $('#perfil').hide();
 $('#pendentes').hide();
 $('#lancamentos').hide();
 $('#representacoes').hide();
 $('#historico').fadeIn(200);
 });
 
 $('#tela-perfil').click(function ()
 {
 $('#enderecos').hide();
 $('#pendentes').hide();
 $('#historico').hide();
 $('#lancamentos').hide();
 $('#representacoes').hide();
 $('#perfil').fadeIn(200);
 });
 
 $('#tela-pendentes').click(function ()
 {
 $('#enderecos').hide();
 $('#historico').hide();
 $('#perfil').hide();
 $('#representacoes').hide();
 $('#lancamentos').hide();
 $('#pendentes').fadeIn(200);
 });
 
 $('#tela-lancamentos').click(function ()
 {
 $('#pendentes').hide();
 $('#enderecos').hide();
 $('#perfil').hide();
 $('#historico').hide();
 $('#representacoes').hide();
 $('#lancamentos').fadeIn(200);
 });
 
 $('#tela-representacoes').click(function ()
 {
 $('#pendentes').hide();
 $('#enderecos').hide();
 $('#perfil').hide();
 $('#historico').hide();
 $('#lancamentos').hide();
 $('#representacoes').fadeIn(200);
 });
 
 */