<article>
    <div class="row">    
        <div class="col-md-12" id="perfil">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Perfil</h2>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <form role="form" id="formulario-info-usuario" method="POST" action="/mmnfretes/alteraInfoUsuario">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Usuário:</label>
                                    <input type="text" name="nome" id="txNome-usuario" class="form-control" placeholder="Nome">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Email:</label>
                                    <input type="email" class="form-control" id="txEmail-usuario" name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Senha:</label>
                                    <input type="password" class="form-control" id="txSenha-usuario" name="senha" placeholder="Senha">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Telefone Fixo:</label>
                                    <input type="tel" class="form-control mask-telefone" name="telefone1" id="txTelefone1"  placeholder="Telefone Fixo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Telefone Celular:</label>
                                    <input type="tel" class="form-control mask-celular" name="telefone2" id="txTelefone2" placeholder="Telefone Celular">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="btnAlterar-info" class="btn btn-primary col-md-3 pull-right">Editar</button>
                                    <button type="button" id="btnSalvar-info" class="btn btn-primary col-md-3 pull-right" data-toggle="modal" data-target="#mensagem-input">Salvar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article> 
