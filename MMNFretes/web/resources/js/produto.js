

/* global AMBIENTE_ATUAL */

function comprarProduto(produto_id, usuario_vendedor)
{
    if ($('#txCepEntregaCompraProduto').val() === '')
    {
        alert('Informe o CEP de entrega!');
        return;
    }

    var params = {
        produto_id: produto_id,
        quant: $('#txQuantidadeCompraProduto').val(),
        usuario_vendedor: usuario_vendedor,
        cep_destino: $('#txCepEntregaCompraProduto').val()
    };

    var url = '/' + AMBIENTE_ATUAL + '/criar-pedido-venda';

    $.post(url, params, function (retorno)
    {
        if (retorno === '1')
            document.location.href = '/' + AMBIENTE_ATUAL + '/paginaperfil';
    });
}