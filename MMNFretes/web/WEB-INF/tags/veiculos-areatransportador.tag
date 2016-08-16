<div class="col-sm-9" id="veiculos-area-transportador">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Veículos</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-4">
                    <img src="resources/img/checked_truck-512.png" class="img-thumbnail" alt="Cinque Terre" width="720" height="720">
                    <span>
                        <label class="btn btn-link col-sm-12" for="upload-file-selector">
                            <input class="col-sm-12" id="upload-file-selector" accept="image/png, image/jpeg, image/gif" type="file">
                            <i class="fa_icon icon-upload-alt"></i>Editar Imagem
                        </label>
                    </span>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <form role="form">
                            <div class="form-group col-sm-6">
                                <input type="text" class="form-control" placeholder="Nome do Veículo" required>
                            </div>
                            <div class="form-group col-sm-2">
                                <input type="text" class="form-control" placeholder="Cap." required>
                            </div>
                            <div class="form-group col-sm-4">
                                <select class="form-control"required>
                                    <option disabled selected>Tipo Carga</option>
                                    <option value="Volta Redonda">Tonelada</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <select class="form-control"required>
                                <option disabled selected>Tipo Carroceria</option>
                                <option value="Volta Redonda">Bitrem</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <select class="form-control"required>
                                <option disabled selected>Carroceria</option>
                                <option value="Volta Redonda">Baú</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <input type="text"class="form-control" placeholder="Valor (R$)" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <input disabled selected type="text"class="form-control" placeholder="Kilômetro" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    Rastreador
                                    <div class="material-switch pull-right">
                                        <input id="rastreador" type="checkbox"/>
                                        <label for="rastreador" class="label-primary"></label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="btn-group col-sm-4">
                            <button type="button"class="btn btn-danger col-sm-12">Excluir</button>
                        </div>
                        <div class="btn-group col-sm-8">
                            <button type="submit"class="btn btn-primary col-sm-12">Adicionar</button>
                        </div>
                    </div>
                </div>
            </div><hr/>
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="text-primary">Lista Veículos</h2>
                    <div id="custom-search-input">
                        <div class="input-group col-md-12">
                            <input type="text" class="form-control input-lg" placeholder="Buscar endereço" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div><br/>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Veículo</th>
                                <th>Capacidade</th>
                                <th>Tipo Carroc.</th>
                                <th>Carroceria</th>
                                <th>Rastreador</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nome do Veículo</td>
                                <td>Capacidade</td>
                                <td>Tipo Carroc.</td>
                                <td>Carroceria</td>
                                <td>Rastreador</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-xs center-block">Editar</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
