$('#formulario-transportador').hide();

$('#transportador').click(function ()
{
   $('#formulario-transportador').fadeIn();
   $('#formulario-usuario').hide();
});

$('#usuario').click(function ()
{
   $('#formulario-usuario').fadeIn();
   $('#formulario-transportador').hide();
});