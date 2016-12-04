$('#formulario-transportador').hide();

$('#transportador').click(function ()
{
    $('#formulario-transportador').fadeIn();
    $('#formulario-usuario').hide();
});

$('#usuario').click(function ()
{
    $('#formulario-usuario').fadeIn();
    $('#formulario-transportador').hide()();
    $('#formulario-transportador').hide();
});

$('#mensagem').toggleClass('in');

$('#btnLogin').click(function ()
{
    var email = $('#txEmail').val();
    var senha = $('#txSenha').val();
    $.ajax
            ({
                url: "/gcfretes/efetualogin?email=" + email + "&senha=" + senha,
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                success: function (result)
                {
                    if (result === 'incorreto')
                    {
                        $('#senhaIncorreta').modal('toggle');
                        $('#senhaIncorreta').modal('show');
                    } else
                    {
                        $(location).attr('href', '/gcfretes/' + result);
                    }
                }
            });
});