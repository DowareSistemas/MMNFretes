<div class="col-sm-9">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Perfil</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-3">
                    <img src="resources/img/img-text.jpg" class="img-thumbnail" alt="Cinque Terre" width="720" height="720">
                </div>
                <div class="col-sm-9">
                    <div class="form-group">
                        <div class="form-group">
                            <form role="form">
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
                                    <div class="form-group col-sm-12">
                                        <div class="input-group image-preview">
                                            <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                                            <span class="input-group-btn">
                                                <!-- image-preview-button button -->
                                                <button type="button" class="btn btn-default image-preview-button" style="display:none;">
                                                    <span class="glyphicon glyphicon-picture"></span> Preview
                                                </button>

                                                <!-- image-preview-clear button -->
                                                <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                                    <span class="glyphicon glyphicon-remove"></span> Clear
                                                </button>

                                                <!-- image-preview-input -->
                                                <div class="btn btn-default image-preview-input">
                                                    <span class="glyphicon glyphicon-folder-open"></span>
                                                    <span class="image-preview-input-title">Arquivo</span>
                                                    <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/> <!-- rename it -->
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="btn-group col-sm-4">
                                        <button type="button" value="0" id="btnExcluir-endereco" class="btn btn-danger col-sm-12">Excluir</button>
                                    </div>
                                    <div class="btn-group col-sm-8">
                                        <button type="submit" id="btnAdicionar-endereco" class="btn btn-primary col-sm-12">Adicionar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2 class="text-primary">Veículos</h2>
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
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Veículo</th>
                                        <th>Capacidade</th>
                                        <th>Eixo</th>
                                        <th>Carroceria</th>
                                        <th>Rastreador</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Nome do Veículo</td>
                                        <td>Capacidade</td>
                                        <td>Eixo</td>
                                        <td>Carroceria</td>
                                        <td>Rastreador</td>
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
        </div>
    </div>
</div>
