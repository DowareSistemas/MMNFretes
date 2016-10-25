<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>

<div class="col-sm-9" id="pendentes">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Pendentes</h2>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-5">
                    <div class="form-group">
                        <select class="form-control input-lg" id="cbGrupos">
                            <option disabled selected value="0">Selecione o grupo</option>
                            <option value="Volta Redonda">Volta Redonda</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-default btn-lg btn-primary col-sm-7" aria-label="Left Align">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="false"></span>
                    </button>
                </div>
            </div>
            <div class="row">
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
                                    <button type="button" class="btn btn-info btn-xs center-block" data-toggle="modal" data-target="#detalhes_cotacao_usuario">+ Inf.</button>
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
                </div>
            </div>
        </div>
    </div>
</div>