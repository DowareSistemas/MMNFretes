<div class="modal fade modal-centralizado" id="detalhes_cotacao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"> Item da cotação </h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <label class="h5"> Transportador </label>
                        <br/>
                        <label id="lbNomeTransportador"> Recuperando informação, por favor aguarde... </label>
                    </div>

                    <div class="row">
                        <label class="h5"> Veículo </label>
                        <br/>
                        <label id="lbNomeVeiculo"> Recuperando informação, por favor aguarde... </label>
                    </div>

                    <div class="row">
                        <label class="h5"> Endereço de origem </label>
                        <br/>
                        <label id="lbEndereco-origem"> Recuperando endereço, por favor aguarde... </label>
                    </div>

                    <div class="row">
                        <label class="h5"> Endereço de destino </label>
                        <br/>
                        <label id="lbEndereco-destino">  Recuperando endereço, por favor aguarde... </label>
                    </div>

                    <div class="row">
                        <label class="h5"> Distância </label>
                        <br/>
                        <label id="lbDistancia"> Recuperando informação, por favor aguarde... </label>
                    </div>

                    <div class="row">
                        <label class="h5"> Valor (R$) </label>
                        <br/>
                        <label id="lbValorItemCotacao"> 0,00 </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" id="btnSolicitarDesconto" value="0"> Solicitar desconto </button>
                <button class="btn btn-success" id="btnGerarBoleto" > Gerar pagamento </button>
                <button class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>