<article>
    <div class="row">    
        <div class="col-md-12" id="pendentes">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Pedidos</h2>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <h3>Cotações Fretes:</h3>
                        <div class="row">
                            <div class="col-md-2">
                                <label>Grupos:</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-9">
                                <select class="form-control" id="cbGrupos">
                                </select>
                            </div>
                            <div class="col-md-3">

                                <button type="button" id="btnRenomearGrupo" class="btn btn-primary btn-block">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                    Renomear grupo
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 table-overflow">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>Status</th>
                                        <th>Transportador</th>
                                        <th>Data</th>
                                        <th>Veículo</th>
                                        <th>Distância</th>
                                        <th>Valor</th>
                                        <th>Ações</th>
                                    </tr>
                                </thead>
                                <tbody id="tabela-cotacoes-usuario">

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-12 table-overflow">
                            <h3>Pedidos Produtos:</h3>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>Status</th>
                                        <th>Cliente</th>
                                        <th>Data</th>
                                        <th>Produto</th>
                                        <th>Valor</th>
                                        <th>Ações</th>
                                    </tr>
                                </thead>
                                <tbody id="tabela-produtos-usuario">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
