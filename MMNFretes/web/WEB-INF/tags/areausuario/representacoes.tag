<article>
    <div class="row">    
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Representa��es</h2>
                </div>
                <div class="panel-body">
                    <!-- Alert -->
                    <div class="alert alert-info fade in">
                        <p class="text-center">Para cada venda conclu�da na plataforma ser� cobrado <strong>10% de �gio</strong>, sob o total vendido.</p>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <img id="img-preview" src="resources/img/img-text.jpg" class="img-thumbnail img-areatransportador" alt="Imagem do produto">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <input type="text" id="fake-file-input-name-representacoes" disabled="disabled" placeholder="Nenhuma imagem selecionada" class="form-control">
                                        <!--  Formul�rio Foto -->
                                        <form id="form-img" runat="server" method="post" enctype="multipart/form-data" action="">
                                            <input id="upload" accept="image/png, image/jpeg, image/gif" style="display: none" type="file" name="file">
                                        </form>
                                        <!-- Formul�rio Foto: FIM -->
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
                                <label id="lbId-produto" hidden="true">0</label>
                                <div class="form-group col-md-8">
                                    <label>Nome Produto:</label>
                                    <input type="text" id="txNome-produto" class="form-control">
                                </div>

                                <div class="form-group col-md-2">
                                    <label>Valor:</label>
                                    <input type="number" id="txPreco-produto" class="form-control">
                                </div>
                                <div class="form-group col-md-2">
                                    <label>Quantidade:</label>
                                    <input type="number" id="txQuantidade-produto" class="form-control">
                                </div>
                                <div class="form-group col-md-2">
                                    <label>Unidade:</label>
                                    <select id="cbUnidade-produto" class="form-control">
                                        <option value="UN">UN</option>
                                        <option value="L">L</option>
                                        <option value="KG">KG</option>
                                        <option value="M">M</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <label>Descri��o:</label>
                                    <textarea rows="3" id="txDescricao-produto" class="form-control"></textarea> 
                                </div>
                                <div class="form-group col-md-12">
                                    <button type="button" id="btnExcluir-produto" class="btn btn-danger">Excluir</button>
                                    <button type="button" id="btnAdicionar-produto" class="btn btn-primary pull-right">Adicionar</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <h3>Lista Lan�amentos</h3>
                            <div class="table-overflow">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome Produto</th>
                                                <th>Valor</th>
                                                <th>Unidade</th>
                                                <th>A��es</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tabela-representacoes">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article> 
