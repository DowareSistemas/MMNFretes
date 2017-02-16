<div class="modal fade bd-example-modal-sm modal-centralizado" data-backdrop="static" data-keyboard="false" id="modal-avaliacao" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmar recebimento da carga</h4>
            </div>
            <div class="modal-body">
                <label>Token de consulta:</label>
                <h4 class="text-success" id="token_consulta">45845-8</h4>
                <hr/>
                <h3>Deixe uma avaliação...</h3>
                
                <p class="text-left">
                    Conte-nos de uma forma breve, sua avaliação sobre o serviço prestado.
                    Sua opinião é importante para que nós possamos aprimorar cada vez
                    mais nossos serviços, visando tornar sua experiência com a GC Fretes cada vez
                    melhor.
                </p>

                <label>Classificação:</label>
                <p id="estrelas">
                    <span id="str-1" class="glyphicon glyphicon-star"></span>
                    <span id="str-2" class="glyphicon glyphicon-star-empty"></span>
                    <span id="str-3" class="glyphicon glyphicon-star-empty"></span>
                    <span id="str-4" class="glyphicon glyphicon-star-empty"></span>
                    <span id="str-5" class="glyphicon glyphicon-star-empty"></span>
                </p>

                <label>Comentário:</label>
                <textarea class="form-control" rows="5" id="txComentario"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnFechaModalAvaliacao">Cancelar</button>
                <button type="button" id="btnEncerraCotacao" class="btn btn-primary" data-dismiss="modal"> OK </button>
            </div>
        </div>
    </div>
</div>