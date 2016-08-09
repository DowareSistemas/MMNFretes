<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags" %>

<div class="col-sm-9" id="perfil">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="Buscar endereço" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="form-group">
                    <h2 class="text-center text-primary">Minhas Informações</h2><hr>
                    <form role="form" id="formulario-info-usuario" action="/MMNFretes/alteraInfoUsuario" method="POST">
                        <div class="form-group col-sm-6">
                            <input type="text" name="nome" id="txNome-usuario" class="form-control" placeholder="Nome">
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="email" class="form-control" id="txEmail-usuario" name="email" placeholder="Email">
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="password" class="form-control" id="txSenha" name="senha" placeholder="Senha">
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="password" class="form-control" id="txConfirm-senha" placeholder="Confirmar senha">
                        </div>

                        <div class="form-group col-sm-4">
                            <input type="tel" class="form-control" name="telefone1" id="txTelefone1"  placeholder="Telefone 1">
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="tel" class="form-control" name="telefone2" id="txTelefone2" placeholder="Telefone 2">
                        </div>
                        <button type="button" id="btnAlterar-info" class="btn btn-primary col-lg-offset-11">Editar</button>
                        <button type="submit" id="btnSalvar-info" class="btn btn-primary col-lg-offset-11">Salvar</button>
                    </form>
                </div>
            </div>
            <h3 class="text-primary">Adicionar ou editar endereços</h3><hr>
            <div class="form-group">
                <form role="form" id="formulario-endereco" action="/MMNFretes/adicionaEndereco" method="POST">
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <input type="number" id="txCep" name="CEP" class="form-control" placeholder="CEP" required>
                        </div>
                        <div class="form-group col-sm-2">
                            <select class="form-control" id="cbUf" name="UF" required>
                                <option disabled selected>UF</option>
                                <option value="RJ">RJ</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-3">
                            <select class="form-control" id="cbMunicipio" name="municipio" required>
                                <option disabled selected>Município</option>
                                <option value="Volta Redonda">Volta Redonda</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <input type="text" id="txBairro" name="bairro" class="form-control" placeholder="Bairro/Distrito" required>
                        </div>
                        <div class="form-group col-sm-3">
                            <input type="text" id="txLogradouro" name="logradouro" class="form-control" placeholder="Logradouro/Nome" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <input type="number" id="txNumero" name="numero" class="form-control" placeholder="Número" required>
                        </div>
                        <div class="form-group col-sm-5">
                            <input type="text" id="txComplemento" name="complemento" class="form-control" placeholder="Complemento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="btn-group col-sm-2">
                            <button type="button" value="0" id="btnExcluir-endereco" class="btn btn-danger col-sm-12">Excluir</button>
                        </div>
                        <div class="btn-group col-sm-5">
                            <button type="submit" id="btnAdicionar-endereco" class="btn btn-primary col-sm-12">Adicionar</button>
                        </div>
                    </div>      
                    <br/>
                </form>

            </div>
            <div class="col-sm-12 table-overflow">
                <h3 class="text-primary">Meus endereços</h3><hr>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CEP</th>
                            <th>UF</th>
                            <th>Município</th>
                            <th>Bairro/Distrito</th>
                            <th>Logradouro/Nome</th>
                            <th>Número</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="enderecos-items">

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>