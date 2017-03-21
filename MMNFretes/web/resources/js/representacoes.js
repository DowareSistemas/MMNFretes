/* global parseFloat, AMBIENTE_ATUAL */
$(document).ready(function ()
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
});

$('#btnAdicionar-produto').click(function ()
{
    var produto =
            {
                id: parseInt($('#lbId-produto').text()),
                nome: $('#txNome-produto').val(),
                descricao: $('#txDescricao-produto').val(),
                tipo: 1,
                preco: parseFloat($('#txPreco-produto').val()).toFixed(2)
            };

    var url = "/" + AMBIENTE_ATUAL + "/salva-produto";
    $.post(url, produto, function (response)
    {
        if (parseInt(response) > 0)
        {
            $('#lbId-produto').text('0');
            $('#txNome-produto').val('');
            $('#txDescricao-produto').val('');
            $('#txPreco-produto').val('0,00');
            
            $('#form-img').attr('action', '/' + AMBIENTE_ATUAL + "/upload-img-produto?produto_id=" + response);
            uploadImagem();
        }
    });
});

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