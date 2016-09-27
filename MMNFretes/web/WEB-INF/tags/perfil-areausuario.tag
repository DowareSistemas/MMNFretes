<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags" %>

<div class="col-sm-9" id="perfil">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Perfil</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-9">
                    <div class="row">
                        <div class="form-group">
                            <form role="form" id="formulario-info-usuario" action="" method="POST">
                                
                                <div class="form-group col-sm-6">
                                    <input type="text" name="nome" id="txNome-usuario" class="form-control" placeholder="Nome">
                                </div>
                                <div class="form-group col-sm-6">
                                    <input type="email" class="form-control" id="txEmail-usuario" name="email" placeholder="Email">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="password" class="form-control" id="txSenha-usuario" name="senha" placeholder="Senha">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="tel" class="form-control" name="telefone1" id="txTelefone1"  placeholder="Telefone 1">
                                </div>
                                <div class="form-group col-sm-4">
                                    <input type="tel" class="form-control" name="telefone2" id="txTelefone2" placeholder="Telefone 2">
                                </div>
                                <div class="col-sm-3 pull-right">
                                    <button type="button" id="btnAlterar-info" class="btn btn-primary col-sm-12">Editar</button>
                                    <button type="button" id="btnSalvar-info" class="btn btn-primary col-sm-12 " data-toggle="modal" data-target="#mensagem-input">Salvar</button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div><hr/>
            <my-tags:endereco-conjunto />
        </div>
    </div>
</div>
