<article>
    <div class="row">    
        <div class="col-md-12" id="perfil-area-transportador">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Perfil</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form role="form">
                                <img src="resources/img/img-text.jpg" class="img-thumbnail" alt="Cinque Terre" width="100px" height="720">
                                <input class="btn btn-primary" id="upload-file-selector" accept="image/png, image/jpeg, image/gif" type="file">
                            </form>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <form role="form" action="">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label>Usuário:</label>
                                            <input type="text" id="txNome" name="usuarios.nome" class="form-control" placeholder="Nome">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label>Email:</label>
                                            <input type="email" id="txEmail" name="usuarios.email" class="form-control" placeholder="Email">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Senha:</label>
                                            <input type="password" id="txSenha" name="usuarios.senha" class="form-control" placeholder="Senha">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label>Telefone Fixo:</label>
                                            <input type="tel" id="txTelefone1" name="usuarios.telefone1" class="form-control mask-telefone" placeholder="Telefone Fixo">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Telefone Celular:</label>
                                            <input type="tel" id="txTelefone2" name="usuarios.telefone2" class="form-control mask-celular" placeholder="Telefone Celular">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label>Número CPF / CNPJ:</label>
                                            <input type="tel" id="txCPF_CNPJ" name="CPF_CNPJ" class="form-control" placeholder="CPF / CNPJ">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Número ANTT:</label>
                                            <input type="tel" id="txANTT" name="ANTT" class="form-control" placeholder="ANTT">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label>Endereço Web Site:</label>
                                            <input type="text" id="txWebsite" name="website" class="form-control" placeholder="Endereço Web Site">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 pull-right">
                                            <button type="button" id="btnEditarInfo" class="btn btn-primary col-md-3 pull-right">Editar</button>
                                            <button type="button" id="btnSalvar-info" class="btn btn-primary col-md-3 pull-right" data-toggle="modal" data-target="#mensagem-input">Salvar</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Meios de Pagamento</h3>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    Boleto
                                    <div class="material-switch pull-right">
                                        <input id="Boleto" name="boleto" type="checkbox"/>
                                        <label for="Boleto" class="label-primary"></label>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    Cartão
                                    <div class="material-switch pull-right">
                                        <input id="Cartao" name="cartao" type="checkbox"/>
                                        <label for="Cartao" class="label-primary"></label>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    Negociação direta
                                    <div class="material-switch pull-right">
                                        <input id="NegociacaoDireta" name="cheque" type="checkbox"/>
                                        <label for="NegociacaoDireta" class="label-primary"></label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>