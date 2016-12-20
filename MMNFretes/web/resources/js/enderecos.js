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
var endereco_atual = 0;

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

    var url = "/gcfretes/inativaEndereco";
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
            endereco_atual = endereco_id;
        }
    });
}