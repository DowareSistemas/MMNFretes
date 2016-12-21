$(document).ready(function ()
{
    $('.mask-cep').mask('00000-000');
    $('.mask-telefone').mask('(00)0000-0000');
    $('.mask-celular').mask('(00)00000-0000');
    $('.mask-capacidade').mask("#.##0", {reverse: true});
    $('.mask-valor').mask("#.##0,00", {reverse: true});
    $('.mask-antt').mask('0000/0000');
});

$('.mask-cpf-cnpj').keydown(function ()
{
    var self = $(this);
    var tamanho = self.val().length;

    try
    {
        $('.mask-cpf-cnpj').unmask();
    } catch (e)
    {
        console.log(e);
    }

    if (tamanho < 14)
        $(".mask-cpf-cnpj").mask("999.999.999-99");
    else
        $(".mask-cpf-cnpj").mask("99.999.999/9999-99");
});
