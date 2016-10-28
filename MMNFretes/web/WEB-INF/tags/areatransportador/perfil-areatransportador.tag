<div class="col-sm-9" id="perfil-area-transportador">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Perfil</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-3">
                    <form role="form">
                        <img src="resources/img/img-text.jpg" class="img-thumbnail" alt="Cinque Terre" width="720" height="720">
                        <span>
                            <label class="btn btn-link col-sm-12" for="upload-file-selector">
                                <input class="col-sm-12" id="upload-file-selector" accept="image/png, image/jpeg, image/gif" type="file">
                                <i class="fa_icon icon-upload-alt"></i>Alterar logo da empresa
                            </label>
                        </span>
                    </form>
                </div>

                <div class="col-sm-9">
                    <div class="row">
                        <div class="form-group">
                            <form role="form" action="">

                                <div class="form-group col-sm-6">
                                    <input type="text" id="txNome" name="usuarios.nome" class="form-control" placeholder="Nome">
                                </div>
                                <div class="form-group col-sm-6">
                                    <input type="email" id="txEmail" name="usuarios.email" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="password" id="txSenha" name="usuarios.senha" class="form-control" placeholder="Senha">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="text" id="txTelefone1" name="usuarios.telefone1" class="form-control" placeholder="Telefone 1">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="text" id="txTelefone2" name="usuarios.telefone2" class="form-control" placeholder="Telefone 2">
                                </div>
                                <div class="form-group col-sm-6">
                                    <input type="text" id="txCPF_CNPJ" name="CPF_CNPJ" class="form-control" placeholder="CPF / CNPJ">
                                </div>
                                <div class="form-group col-sm-6">
                                    <input type="text" id="txANTT" name="ANTT" class="form-control" placeholder="ANTT">
                                </div>
                                <div class="form-group col-sm-12">
                                    <input type="text" id="txWebsite" name="website" class="form-control" placeholder="Endereço Web Site">
                                </div>
                                <div class="col-sm-3 pull-right">
                                    <button type="button" id="btnEditarInfo" class="btn btn-primary col-sm-12">Editar</button>
                                    <button type="button" id="btnSalvar-info" class="btn btn-primary col-sm-12">Salvar</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div><hr/>

            <div class="row">
                <div class="col-sm-12">
                    <h2 class="text-primary">Meios de Pagamento</h2>
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
