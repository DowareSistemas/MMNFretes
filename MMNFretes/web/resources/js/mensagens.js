function showMsgSimNao(mensagem)
{
    $('#msg-sn-texto').text(mensagem);
  //  $('#msg-sn-btnNAO').attr('id', id_btnNAO);
  //  $('#msg-sn-btnSIM').attr('id', id_btnSIM);
    
    $('#mensagem-sn').modal('toggle');
    $('#mensagem-sn').modal('show');
}