<article>
    <div class="row">    
        <div class="col-md-12" id="representacoes">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Representações</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <img id="img-representacoes" src="resources/img/img-text.jpg" class="img-thumbnail img-areatransportador" alt="Imagem do produto">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <input type="text" id="fake-file-input-name-representacoes" disabled="disabled" placeholder="Nenhuma imagem selecionada" class="form-control">
                                        <!--  Formulário Foto -->
                                        <form id="form-img" runat="server" method="post" enctype="multipart/form-data" action="">
                                            <input id="upload" accept="image/png, image/jpeg, image/gif" style="display: none" type="file" name="file">
                                        </form>
                                        <!-- Formulário Foto: FIM -->
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" id="fake-file-button-browse-representacoes" type="button">
                                                <i class="glyphicon glyphicon-pencil"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <div class="form-group col-md-10">
                                    <label>Nome Produto:</label>
                                    <input type="text" class="form-control">
                                </div>

                                <div class="form-group col-md-2">
                                    <label>Valor:</label>
                                    <input type="number" class="form-control">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Descrição:</label>
                                    <textarea rows="3" class="form-control"></textarea> 
                                </div>

                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <button type="button" id="btnExcluir-representacoes" class="btn btn-danger">Excluir</button>
                                    <button type="button" id="btnAdicionar-representacoes" class="btn btn-primary pull-right">Adicionar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article> 