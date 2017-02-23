$(document).ready(function ()
{
    verificaTipoUsuario();
});

/*
 * Esta função é responsável por verificar o
 * tipo de usuário e aplicar as mudanças nos
 * elementos da NavBar de acordo com o perfil
 * do usuário
 */
function verificaTipoUsuario()
{
    var url = '/gcfretes/tipo_usuario';
    $.get(url, function (tipo_usuario)
    {
        if (tipo_usuario === '-1')
            $('#li-lancamentos').hide();

        if (tipo_usuario === '0')
            $('#li-lancamentos').hide();

        if (tipo_usuario === '1')
            $('#li-lancamentos').show();
    });
}