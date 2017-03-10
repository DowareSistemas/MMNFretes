function showMsgSimNao(mensagem)
{
    $('#msg-sn-texto').text(mensagem);
    
    $('#mensagem-sn').modal('toggle');
    $('#mensagem-sn').modal('show');
}

function showMsgOK(idMsg)
{
    $(idMsg).modal('toggle');
    $(idMsg).modal('show');
}