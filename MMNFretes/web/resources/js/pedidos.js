/* global AMBIENTE_ATUAL, parseFloat */

var COTACAO_ID = 1;

$(document).ready(function ()
{
    listarPedidosVendas();
    listarPedidosCompra();

    $('#btnVincular').click(function ()
    {
        vincularPedidosCotacao();
    });
});

function vincularPedidosCotacao()
{
    $('#tabela-pedidos-vincular > tr').each(function ()
    {
        var tr = $(this);
        var checkBox = tr[0].cells[0].firstChild;
        var idPedido = tr[0].cells[1].firstChild.data;
        var precoFrete = parseFloat($(tr[0].cells[7].firstChild.nextElementSibling).val()).toFixed(2);

        if (checkBox.checked && precoFrete > 0)
        {
            var params = {
                pedido_id: idPedido,
                cotacao_id: COTACAO_ID,
                preco_frete: precoFrete
            };
            var url = '/' + AMBIENTE_ATUAL + '/salvar-vinculo-pedido';
            $.post(url, params, function (response)
            {
                if (response === '1')
                    window.location.href = "/" + AMBIENTE_ATUAL + "/paginaperfil";
            });
        }
    });
}

function listarPedidosVendas()
{
    var url = '/' + AMBIENTE_ATUAL + '/listar-pedidos';
    $.post(url, {tipo: 1}, function (content)
    {
        $('#tabela-pedidos-venda').html(content);
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