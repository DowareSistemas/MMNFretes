<div class="modal fade bd-example-modal-sm" id="pesquisa-mapa" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Localizar endereço</h4>
            </div>
            <div class="modal-body">

                <div id="map">
                    <div class="row">
                        <div class="col-md-10 form-group">
                            <label for="txtEndereco">Endereço:</label>
                            <input class="form-control" type="text" id="txtEndereco" name="txtEndereco" />
                        </div>
                        <div class="col-md-2 form-group">
                            <label></label>
                            <input class="btn btn-primary btn-block" type="button" id="btnEndereco" name="btnEndereco" value="Mostrar" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div id="mapa" style="height: 300px;">
                            </div>
                        </div>
                    </div>

                    <input type="hidden" class="form-control" id="txtLatitude" name="txtLatitude" />
                    <input type="hidden" class="form-control" id="txtLongitude" name="txtLongitude" />
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-left">
                    <label class="h4" id="lbDescricao-endereco"> Teste </label>
                </div>
                <button type="button" id="btnConfirmarCepMaps" class="btn btn-primary" data-dismiss="modal"> OK </button>
            </div>
        </div>
    </div>
</div>