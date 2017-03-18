$(document).ready(function ()
{
    $('#form-config').prop('action', '/' + AMBIENTE_ATUAL + '/autconfig'); 
    $('#configs').hide();
});

$('#btnLogin').click(function ()
{
    $('#form-config').ajaxForm(
            {
                success: function (data)
                {
                    if (data === "1")
                    {
                        $('#form-config').fadeOut(500);
                        $('#configs').fadeIn(800);
                    }
                }
            }).submit();
});

$('#btnSalvar').click(function ()
{
    if ($('#cbConfigs').val() === "0")
    {
        $('#lbDescricao').text('Selecione uma configuração');
        return;
    }

    var configuracao =
            {
                id: $('#cbConfigs').val(),
                valor: $('#txValor').val()
            };

    var url = "/" + AMBIENTE_ATUAL + "/updateconfig";

    $.post(url, configuracao, function (response)
    {
        if (response === "1")
            $('#lbDescricao').text('Configuração salva');
        else
            $('#lbDescricao').text('Ocorreu um problema ao salvar a configuração');
    });
});

$('#cbConfigs').change(function ()
{
    var configParam =
            {
                config_id: $('#cbConfigs').val()
            };
    var url = "/" + AMBIENTE_ATUAL + "/descricaoconfig";
    $.post(url, configParam, function (response)
    {
        $('#lbDescricao').text(response);
    });
});