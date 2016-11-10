$(document).ready(function ()
{
    $('.mask-cep').mask('00000-000');
    $('.mask-telefone').mask('(00)0000-0000');
    $('.mask-celular').mask('(00)00000-0000');
    $('.mask-capacidade').mask("#.##0", {reverse: true});
    $('.mask-valor').mask("#.##0,00", {reverse: true});
    //as demais classes adicionar apartir daqui
});