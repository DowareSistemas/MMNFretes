<div class="col-sm-9">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Minhas Informa��es</h1>
        </div>
        <div class="panel-body">
            <div class="row">
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
                            <input type="text" class="form-control" placeholder="Telefone Prim�rio">
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" placeholder="Telefone Segund�rio">
                        </div>
                        <button type="button" class="bottom-right btn btn-link col-sm-offset-11">Editar</button>
                    </form>
                </div>
            </div>
            <h2 class="text-primary">Adicionar ou editar endere�os</h2><hr>
            <div class="form-group">
                <form role="form">
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <input type="text" class="form-control" placeholder="CEP">
                        </div>
                        <div class="form-group col-sm-2">
                            <select class="form-control" id="sel1">
                                <option disabled selected>UF</option>
                                <option>1</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-3">
                            <select class="form-control" id="sel1">
                                <option disabled selected>Munic�pio</option>
                                <option>1</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" placeholder="Bairro/Distrito">
                        </div>
                        <div class="form-group col-sm-3">
                            <input type="text" class="form-control" placeholder="Logradouro/Nome">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <input type="text" class="form-control" placeholder="N�mero">
                        </div>
                        <div class="form-group col-sm-5">
                            <input type="text" class="form-control" placeholder="Complemento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="btn-group col-sm-2">
                            <button type="button" class="btn btn-danger col-sm-12">Excluir</button>
                        </div>
                        <div class="btn-group col-sm-5">
                            <button type="button" class="btn btn-primary col-sm-12">Adicionar/Salvar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 table-overflow">
                <h2 class="text-primary">Meus endere�os</h2><hr>
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
                    <tbody>
                        <tr>
                            <td>CEP</td>
                            <td>UF</td>
                            <td>Munic�pio</td>
                            <td>Bairro/Distrito</td>
                            <td>Logradouro/Nome</td>
                            <td>N�mero</td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>