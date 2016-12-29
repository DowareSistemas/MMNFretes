<article>
    <div class="row">    
        <div class="col-md-12" id="perfil-area-transportador">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Perfil</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <img src="resources/img/img-text.jpg" id="img-perfil" class="img-thumbnail img-areatransportador" alt="Imagem do transportador" width="300" height="306">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <input type="text" id="fake-file-input-name-perfil" disabled="disabled" placeholder="Nenhuma imagem selecionada" class="form-control">
                                        <!--  Formulário Foto -->
                                        <form id="form-img-perfil" runat="server" method="post" enctype="multipart/form-data" action="">
                                            <input id="upload-perfil" accept="image/png, image/jpeg, image/gif" type="file" style="display:none" name="file">
                                        </form>
                                        <!-- Formulário Foto: FIM -->
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" id="fake-file-button-browse-perfil" type="button" title="Editar imagem">
                                                <i class="glyphicon glyphicon-pencil"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <!--  Formulario Info  -->
                            <form role="form" id="formulario-info-transportador" method="POST" action="/gcfretes/alteraInfoTransportadora">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label>Usuário:</label>
                                        <input type="text" id="txNome" name="usuarios.nome" class="form-control" title="Nome">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Email:</label>
                                        <input type="email" id="txEmail-transportador" name="usuarios.email" class="form-control" title="Email">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Senha:</label>
                                        <input type="password" id="txSenha-transportador" name="usuarios.senha" class="form-control" title="Senha">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Telefone Fixo:</label>
                                        <input type="tel" id="txTelefone1" name="usuarios.telefone1" class="form-control mask-telefone" title="Telefone Fixo">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Telefone Celular:</label>
                                        <input type="tel" id="txTelefone2" name="usuarios.telefone2" class="form-control mask-celular" title="Telefone Celular">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Número CPF / CNPJ:</label>
                                        <input type="tel" id="txCPF_CNPJ" name="CPF_CNPJ" class="form-control" title="CPF / CNPJ">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Número ANTT:</label>
                                        <input type="tel" id="txANTT" name="ANTT" class="form-control" title="ANTT">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label>Endereço Web Site:</label>
                                        <input type="text" id="txWebsite" name="website" class="form-control" title="Endereço Web Site">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 pull-right">
                                        <button type="button" id="btnEditarInfo" class="btn btn-primary col-md-3 pull-right" title="Editar">Editar</button>
                                        <button type="button" id="btnSalvar-info" class="btn btn-primary col-md-3 pull-right" data-toggle="modal" data-target="#mensagem-input" Editar="Salvar">Salvar</button>
                                    </div>
                                </div>
                            </form>
                            <!-- Formulario Info: FIM -->
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Meios de Pagamento</h3>
                            <ul class="list-group">
                                <!-- Pag Seguro CK -->
                                <li class="list-group-item">
                                    PagSeguro
                                    <div class="material-switch pull-right">
                                        <input id="Pagseguro" name="pag_seguro" type="checkbox" title="Boleto"/>
                                        <label for="Boleto" class="label-primary"></label>
                                    </div>
                                </li>
                                <!-- Pag Seguro CK -->
                                
                                <!-- Negociacao Direta CK -->
                                <li class="list-group-item">
                                    Negociação direta
                                    <div class="material-switch pull-right">
                                        <input id="NegociacaoDireta" name="cheque" type="checkbox" title="Negociação direta"/>
                                        <label for="NegociacaoDireta" class="label-primary"></label>
                                    </div>
                                </li>
                                <!-- Negociacao Direta CK -->
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>