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