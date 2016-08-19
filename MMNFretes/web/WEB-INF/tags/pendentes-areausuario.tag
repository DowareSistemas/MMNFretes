<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>

<div class="col-sm-9" id="pendentes">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Pendentes</h2>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-10">
                    <div class="form-group">
                        <select class="form-control input-lg" id="cbGrupos">
                            <option value="Volta Redonda">Volta Redonda</option>
                            <option value="Volta Redonda">Volta Redonda</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-default btn-lg btn-primary col-sm-12" aria-label="Left Align">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="false"></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" class="form-control input-lg" placeholder="Buscar por transportador, data, ve�culo ou forma de pagamento" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div><br/>
            <div class="row">
                <div class="col-sm-12 table-overflow">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Status</th>
                                <th>Transportador</th>
                                <th>Data</th>
                                <th>Ve�culo</th>
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
                                <td>Ve�culo</td>
                                <td>Pagamento</td>
                                <td>Valor</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-xs col-sm-8">A��o</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-info btn-xs center-block">+ Inf.</button>
                                </td>
                                <td>Status</td>
                                <td>Transportador</td>
                                <td>Data</td>
                                <td>Ve�culo</td>
                                <td>Pagamento</td>
                                <td>Valor</td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-xs col-sm-8">Cancelar</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="alert alert-info">
                        <strong>Ol�,</strong> o que gostaria de fazer?
                        <button type="button" class="btn btn-primary btn-sm">Pagar</button>
                        <button type="button" class="btn btn-danger btn-sm">Cancelar</button>
                    </div>
                    <div class="alert alert-danger">
                        <strong>Ol�,</strong> voc� tem certeza que quer cancelar?
                        <button type="button" class="btn btn-danger btn-sm">Cancelar</button>                        
                    </div>
                    <div class="panel-footer">+ Informa��es</div>
                </div>
            </div>
        </div>
    </div>
</div>