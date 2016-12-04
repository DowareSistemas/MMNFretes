var modoEdicaoInfo = false;

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
});

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
    var self = $(this);
    $('#btnConfirmaExclusaoEndereco').val(self.val());
});

$('#btnConfirmaExclusaoEndereco').click(function ()
{
    var self = $(this);

    $.ajax({
        url: "/gcfretes/inativaEndereco?endereco_id=" + self.val(),
        success: function (mensagem)
        {
            $('#btnExcluir-endereco').fadeOut(100);
            $('#btnAdicionar-endereco').text('Adicionar');
            carregaEnderecos();
        }
    });

    self.val(0);
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
        }
    });
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
