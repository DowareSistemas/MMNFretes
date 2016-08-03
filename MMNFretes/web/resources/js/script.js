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


$('#acao').click(function ()
{
    $.ajax({
        url: "/MMNFretes/listaEnderecos?usuarios_id=1",
        
        success: function (data) 
        {
            $('#tabela').append(data);
        }
    });
});