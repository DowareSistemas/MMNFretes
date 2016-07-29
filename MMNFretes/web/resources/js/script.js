$('#formulario-transportador').hide();

$('#checkbox-transportadora').click(function ()
{
   $('#formulario-transportador').fadeIn();
   $('#formulario-usuario').fadeOut()();
});

$('#checkbox-usuario').click(function ()
{
   $('#formulario-usuario').fadeIn();
   $('#formulario-transportador').fadeOut()();
});