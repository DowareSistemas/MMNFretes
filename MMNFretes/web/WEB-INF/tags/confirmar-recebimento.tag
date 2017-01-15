<div class="modal fade bd-example-modal-sm modal-centralizado" id="modal-confirma-recebimento" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" id="teste">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirmar recebimento</h4>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <div class="row pull-left">
                        <label> Informe o token </label>
                    </div>
                    <div class="row">
                        <input type="text" id="txToken_envio" class="form-control" style="margin-bottom: 10px;" />
                    </div>

                    <div class="row">
                        <div class="pull-left">
                            <label id="lbMensagemValidacaoToken">Token de autorização:</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="pull-left">
                            <h4 id="lbToken_autorizacao"></h4>
                        </div>
                    </div>

                    <div class="row">
                        <button type="button" class="btn btn-default" data-dismiss="modal"> Cancelar </button>
                        <button type="submit" id="btnEnviaToken" class="btn btn-primary">Enviar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>