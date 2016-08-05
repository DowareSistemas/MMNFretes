<div class="col-sm-9">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="Buscar endere�o" />
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
                    <h2 class="text-center text-primary">Minhas Informa��es</h2><hr>
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
                            <input type="text" class="form-control" placeholder="Telefone Prim�rio">
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" placeholder="Telefone Segund�rio">
                        </div>
                        <button type="button" class="bottom-right btn btn-link col-sm-offset-11">Editar</button>
                    </form>
                </div>
            </div>
            <h3 class="text-primary">Adicionar ou editar endere�os</h3><hr>
            <div class="form-group">
                <form role="form" id="formulario-endereco" action="/MMNFretes/adicionaEndereco" method="POST">
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <input type="text" id="txCep" name="CEP" class="form-control" placeholder="CEP" required>
                        </div>
                        <div class="form-group col-sm-2">
                            <select class="form-control" id="cbUf" name="UF" required>
                                <option disabled selected>UF</option>
                                <option value="RJ">RJ</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-3">
                            <select class="form-control" id="cbMunicipio" name="municipio" required>
                                <option disabled selected>Munic�pio</option>
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
                            <input type="number" id="txNumero" name="numero" class="form-control" placeholder="N�mero" required>
                        </div>
                        <div class="form-group col-sm-5">
                            <input type="text" id="txComplemento" name="complemento" class="form-control" placeholder="Complemento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="btn-group col-sm-2">
                            <button type="button" id="btnExcluir" class="btn btn-danger col-sm-12">Excluir</button>
                        </div>
                        <div class="btn-group col-sm-5">
                            <button type="submit" id="btnAdicionar-endereco" class="btn btn-primary col-sm-12">Adicionar/Salvar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 table-overflow">
                <h3 class="text-primary">Meus endere�os</h3><hr>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CEP</th>
                            <th>UF</th>
                            <th>Munic�pio</th>
                            <th>Bairro/Distrito</th>
                            <th>Logradouro/Nome</th>
                            <th>N�mero</th>
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