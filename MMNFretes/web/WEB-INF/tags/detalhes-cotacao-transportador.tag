<div class="modal fade modal-centralizado" id="detalhes_cotacao_transportador" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="modal-detalhes-cotacao-transportador">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"> Detalhes da oportunidade </h4>
            </div>
            <div class="modal-body">
                <div class="container">

                    <!-- div detalhes -->
                    <div id="div-detalhes">
                        <div class="row">
                            <label class="h5"> Cliente </label>
                            <br/>
                            <label id="lbNomeCliente"> </label>
                        </div>

                        <div class="row">
                            <label class="h5"> Veículo </label>
                            <br/>
                            <label id="lbNomeVeiculo"> </label>
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
                            <label id="lbDistancia"> </label>
                        </div>

                        <div class="row">
                            <label class="h5"> Valor (R$) </label>
                            <br/>
                            <label id="lbValorItemCotacao"> 0,00 </label>
                        </div>
                    </div>
                    <!--  Detalhes -->

                    <!--  div desconto -->
                    <div id="div-desconto">
                        <div class="row">
                            <label class="h4"> Responder solicitação de desconto </label>

                            <div class="row">
                                <div class="col-md-2">
                                    <a class="list-group-item" id="btnDescPercentual" href="#"> Percentual </a>
                                    <a class="list-group-item" id="btnDescValor" href="#"> Valor </a>
                                </div>

                                <!-- desconto percentual -->
                                <div class="col-md-10" id="div-percentual">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label class="h4"> Valor atual: </label>
                                        </div>

                                        <div class="col-sm-2">
                                            <label class="h4" id="lbValorAtual"> R$ 0,00 </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label class="h4" id="lbTextoDesconto"> Desconto (%): </label>
                                        </div>

                                        <div class="col-sm-2">
                                            <input type="number" id="txValorDesconto" class="form-control" value=""/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label class="h4"> Valor final: </label>
                                        </div>

                                        <div class="col-sm-2">
                                            <label class="h4" id="lbValorFinal"> R$ 0,00 </label>
                                        </div>
                                    </div>
                                </div>
                                <!--  desconto percentual -->

                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="pull-right">
                                        <button class="btn btn-danger btn-sm" id="btnRecusaDesconto"> Recusar desconto </button>
                                        <button class="btn btn-primary btn-sm" id="btnConfirmaDesconto"> Confirmar desconto </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- desconto -->

                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-left">
                    <button class="btn btn-success" id="btnDesconto">Solicitação de desconto</button>
                </div>
                <button class="btn btn-default" data-dismiss="modal"> Fechar </button>
            </div>
        </div>
    </div>
</div>