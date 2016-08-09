<div class="col-sm-9">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Perfil</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-3">
                    <img src="resources/img/img-text.jpg" class="img-thumbnail" alt="Cinque Terre" width="720" height="720">
                </div>
                <div class="col-sm-9">
                    <div class="form-group">
                        <form role="form">
                            <div class="form-group col-sm-6">
                                <input type="text" class="form-control" placeholder="Nome">
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="text" class="form-control" placeholder="Email">
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" placeholder="Senha">
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" placeholder="Telefone Primário">
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" placeholder="Telefone Segundário">
                            </div>
                            <div class="form-group col-sm-12">
                                <input type="text" class="form-control" placeholder="Endereço Web Site">
                            </div>
                            <div class="form-group col-sm-12">
                                <div class="input-group image-preview">
                                    <input type="text" class="form-control image-preview-filename"> <!-- don't give a name === doesn't send on POST/GET -->
                                    <span class="input-group-btn">
                                        <!-- image-preview-button button -->
                                        <button type="button" class="btn btn-default image-preview-button" style="display:none;">
                                            <span class="glyphicon glyphicon-picture"></span> Preview
                                        </button>

                                        <!-- image-preview-clear button -->
                                        <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                            <span class="glyphicon glyphicon-remove"></span> Clear
                                        </button>

                                        <!-- image-preview-input -->
                                        <div class="btn btn-default image-preview-input">
                                            <span class="glyphicon glyphicon-folder-open"></span>
                                            <span class="image-preview-input-title">Arquivo</span>
                                            <input type="file" accept="image/png, image/jpeg, image/gif" /> <!-- rename it -->
                                        </div>
                                    </span>
                                </div>
                            </div>
                            <button type="button" class="bottom-right btn btn-link col-sm-offset-11">Editar</button>
                        </form>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="text-primary">Meios de Pagamento</h2>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item">
                                Á Vista
                                <div class="material-switch pull-right">
                                    <input id="Avista" name="avista" type="checkbox"/>
                                    <label for="Avista" class="label-primary"></label>
                                </div>
                            </li>
                            <li class="list-group-item">
                                Cartão de Crédito
                                <div class="material-switch pull-right">
                                    <input id="Cartao" name="cartao" type="checkbox"/>
                                    <label for="Cartao" class="label-primary"></label>
                                </div>
                            </li>
                            <li class="list-group-item">
                                Boleto
                                <div class="material-switch pull-right">
                                    <input id="Boleto" name="boleto" type="checkbox"/>
                                    <label for="Boleto" class="label-primary"></label>
                                </div>
                            </li>
                            <li class="list-group-item">
                                Cheque
                                <div class="material-switch pull-right">
                                    <input id="Cheque" name="cheque" type="checkbox"/>
                                    <label for="Cheque" class="label-primary"></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
