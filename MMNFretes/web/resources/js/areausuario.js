var modoEdicaoInfo = false;

$('#btnAdicionar-endereco').click(function ()
{
    $('#formulario-endereco').ajaxForm
            ({
                success: function (data)
                {
                    $('#enderecos-items').html("");
                    $('#enderecos-items').append(data);
                    $('#formulario-endereco')[0].reset();
                    $('#btnExcluir-endereco').fadeOut(100);
                    $('#btnAdicionar-endereco').text('Adicionar');
                    $('#formulario-endereco').attr('action', '/MMNFretes/adicionaEndereco');
                }
            });
});

$(document).ready(function ()
{
    $('#btnExcluir').hide();
    $('#pendentes').hide();
    $('#historico').hide();
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
    $('#txSenha').prop('disabled', estado);
    $('#txConfirm-senha').prop('disabled', estado);
    $('#txTelefone1').prop('disabled', estado);
    $('#txTelefone2').prop('disabled', estado);
}

function carregaInfoUsuario()
{
    $.ajax({
        url: "/MMNFretes/infoUsuario",
        dataType: 'json',
        accepts: "application/json",
        success: function (usuario)
        {
            $('#txNome-usuario').val(usuario.nome);
            $('#txEmail-usuario').val(usuario.email);
            $('#txSenha').val(usuario.senha);
            $('#txConfirm-senha').val(usuario.senha);
            $('#txTelefone1').val(usuario.telefone1);
            $('#txTelefone2').val(usuario.telefone2);
        }
    });
}

function carregaEnderecos()
{
    $.ajax({
        url: "/MMNFretes/listaEnderecos",
        success: function (data)
        {
            $('#formulario-endereco').attr('action', '/MMNFretes/adicionaEndereco');
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
        url: "/MMNFretes/inativaEndereco?endereco_id=" + self.val(),
        dataType: 'text',
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
        url: "/MMNFretes/carregaEndereco?endereco_id=" + endereco_id,
        dataType: 'json',
        success: function (endereco)
        {
            $('#btnAdicionar-endereco').text('Salvar alterações');
            $('#formulario-endereco').attr('action', '/MMNFretes/alteraEndereco?endereco_id=' + endereco_id);
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
    var senha = $('#txSenha').val();
    var senhaConfirmada = $('#txSenhaConfirmada').val();

    var nome = $('#txNome-usuario').val();
    var email = $('#txEmail-usuario').val();
    var telefone1 = $('#txTelefone1').val();
    var telefone2 = $('#txTelefone2').val();
    
    
    if (senha === senhaConfirmada)
    {
        $.ajax
        ({
                    url: "/MMNFretes/alteraInfoUsuario?senha="      + senha +
                                                      "&nome="      + nome  +
                                                      "&email="     + email + 
                                                      "&telefone1=" + telefone1 + 
                                                      "&telefone2=" + telefone2,
            success: function ()
            {
                carregaInfoUsuario();
                hab_desab_formInfo(true);
                $('#btnAlterar-info').fadeIn();
                $('#btnSalvar-info').hide();
            }
        });
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

$('#btnSalvar-info').click(function ()
{

});

$('#tela-historico').click(function ()
{
    $('#perfil').hide();
    $('#pendentes').hide();
    $('#historico').fadeIn(200);
});

$('#tela-perfil').click(function ()
{
    $('#pendentes').hide();
    $('#historico').hide();
    $('#perfil').fadeIn(200)();
    carregaEnderecos();
});

$('#tela-pendentes').click(function ()
{
    $('#perfil').hide();
    $('#historico').hide();
    $('#pendentes').fadeIn(200);
});
