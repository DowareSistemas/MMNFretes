<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>

<div class="col-sm-9" id="pendentes">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Pendentes</h2>
        </div>
        <div class="panel-body">
            <div class="row">

                <div class="col-sm-9 col-xs-6">
                    <div id="custom-search-input">
                        <div class="input-group col-sm-10 col-xs-8">
                            <input type="text" class="form-control input-sm" placeholder="Buscar por Transportador, Data, Veículo ou forma de pagamento" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-sm" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-3 col-xs-4">

                        <select class="form-control input-sm" id="cbGrupos" name="grupos" required>
                            <option disabled selected>Selecionar grupo</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                            <option style="font-family: Helvetica" value="Volta Redonda">Volta Redonda</option>
                        </select>
                    </div>

                    <div style="margin-top: -1px;">
                        <button id="btnEditar-grupo" class="btn btn-info btn-sm glyphicon glyphicon-pencil"></button>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-sm-12 table-overflow">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Status</th>
                                <th>Transportador</th>
                                <th>Data</th>
                                <th>Veículo</th>
                                <th>Pagamento</th>
                                <th>Valor</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-info btn-xs center-block">+ Inf.</button>
                                </td>
                                <td>Status</td>
                                <td>Transportador</td>
                                <td>Data</td>
                                <td>Veículo</td>
                                <td>Pagamento</td>
                                <td>Valor</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-xs col-sm-8">Ação</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-info btn-xs center-block">+ Inf.</button>
                                </td>
                                <td>Status</td>
                                <td>Transportador</td>
                                <td>Data</td>
                                <td>Veículo</td>
                                <td>Pagamento</td>
                                <td>Valor</td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-xs col-sm-8">Cancelar</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="alert alert-info">
                        <strong>Olá,</strong> o que gostaria de fazer?
                        <button type="button" class="btn btn-primary btn-sm">Pagar</button>
                        <button type="button" class="btn btn-danger btn-sm">Cancelar</button>
                    </div>
                    <div class="alert alert-danger">
                        <strong>Olá,</strong> você tem certeza que quer cancelar?
                        <button type="button" class="btn btn-danger btn-sm">Cancelar</button>                        
                    </div>
                    <div class="panel-footer">+ Informações</div>
                </div>
            </div>
        </div>
    </div>
</div>