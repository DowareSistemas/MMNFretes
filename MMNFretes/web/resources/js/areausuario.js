var modoEdicaoInfo = false;

$(document).ready(function ()
{
    $('#btnExcluir').hide();
    $('#pendentes').hide();
    $('#historico').hide();
    $('#enderecos').hide();
    $('#btnSalvar-info').hide();
    $('#btnEditar-grupo').hide();
    carregaInfoUsuario();
    hab_desab_formInfo(true);
    carregaEnderecos();
    $('#li-deslogado').hide();
    $('#li-logado').hide();
    $('#btnVisualizaCotacoes').hide();
    listaGruposCotacoes();
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

$('#cbGrupos').change(function ()
{
    var itemCb = $(this);
    listaCotacoes(itemCb.val());
});

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
});

$('#tela-historico').click(function ()
{
    $('#enderecos').hide();
    $('#perfil').hide();
    $('#pendentes').hide();
    $('#historico').fadeIn(200);
});

$('#tela-perfil').click(function ()
{
    $('#enderecos').hide();
    $('#pendentes').hide();
    $('#historico').hide();
    $('#perfil').fadeIn(200);
});

$('#tela-pendentes').click(function ()
{
    $('#enderecos').hide();
    $('#perfil').hide();
    $('#historico').hide();
    $('#pendentes').fadeIn(200);
});
