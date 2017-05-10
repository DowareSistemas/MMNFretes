/* global parseFloat, AMBIENTE_ATUAL */
$(document).ready(function ()
{
    configurarInputFile();
    listaProdutos();
    $('#btnExcluir-produto').fadeOut(400);
});

function listaProdutos()
{
    var url = "/" + AMBIENTE_ATUAL + "/listaProdutosUsuario";
    $.post(url, function (result)
    {
        $('#tabela-representacoes').html(result);
    });
}

$('#btnAdicionar-produto').click(function ()
{
    var produto =
            {
                id: parseInt($('#lbId-produto').text()),
                nome: $('#txNome-produto').val(),
                descricao: $('#txDescricao-produto').val(),
                tipo: 1,
                preco: parseFloat($('#txPreco-produto').val()).toFixed(2),
                unidade: $('#cbUnidade-produto').val(),
                quant: $('#txQuantidade-produto').val()
            };

    var url = "/" + AMBIENTE_ATUAL + "/salva-produto";
    $.post(url, produto, function (response)
    {
        if (parseInt(response) > 0)
        {
            $('#btnExcluir-produto').fadeOut(400);
            $('#btnAdicionar-produto').text('Salvar');
            $('#lbId-produto').text('0');
            $('#txNome-produto').val('');
            $('#txDescricao-produto').val('');
            $('#txPreco-produto').val('0,00');
            $('#form-img').attr('action', '/' + AMBIENTE_ATUAL + "/upload-img-produto?produto_id=" + response);

            listaProdutos();
            uploadImagem();
        }
    });
});

function criaPedidoVenda(produto_id)
{
    window.location.href = '/' + AMBIENTE_ATUAL + '/produto?id=' + produto_id;
}

function carregaProduto(produto_id)
{
    var url = "/" + AMBIENTE_ATUAL + "/findProduto";
    var param = {produto_id: produto_id};
    $.post(url, param, function (produto)
    {
        $('#btnAdicionar-produto').text('Salvar');
        $('#btnExcluir-produto').fadeIn(400);
        $('#lbId-produto').text(produto.id);
        $('#txNome-produto').val(produto.nome);
        $('#txPreco-produto').val(parseFloat(produto.preco.toString()).toFixed(2));
        $('#txDescricao-produto').val(produto.descricao);
        $('#cbUnidade-produto').val(produto.unidade);

        getImgProduto(produto_id);
    });
}

function getImgProduto(produto_id)
{
    var url = "/" + AMBIENTE_ATUAL + "/produto_path?produto_id=" + produto_id;

    $.get(url, function (urlImgPath)
    {
        $('#img-preview').attr('src', urlImgPath);
    });
}

function uploadImagem()
{
    if ($('#fake-file-input-name-representacoes').val() === '')
    {
        $('#img-preview').attr('src', 'resources/img/img-text.jpg');
        return;
    }

    $('#form-img').ajaxForm({
        success: function (data)
        {
            $('#img-preview').attr('src', 'resources/img/img-text.jpg');
            $('#upload').val(null);
        }
    }).submit();
}

function configurarInputFile()
{
    try
    {
        document.getElementById('fake-file-button-browse-representacoes').addEventListener('click', function ()
        {
            document.getElementById('upload').click();
        });

        document.getElementById('upload').addEventListener('change', function ()
        {
            document.getElementById('fake-file-input-name-representacoes').value = this.value;
            document.getElementById('upload').removeAttribute('disabled');

            var input = this;

            if (input.files && input.files[0])
            {
                var reader = new FileReader();

                reader.onload = function (e)
                {
                    $('#img-preview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        });
    } catch (e)
    {

    }
}

var representante_id = 0;

$('#alguns-produtos').on('show.bs.collapse', function (e)
{
    var url = '/' + AMBIENTE_ATUAL + '/produtosRepresentante?representante_id=' + representante_id;
    $.get(url, function (content)
    {
        $('#produtos-representante').html(content);
    });
});

function exibirProdutosRepresentante(id_representante)
{
    representante_id = id_representante;
}