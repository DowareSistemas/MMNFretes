<article id="pagamentos-admin">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Pagamentos</h2>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 form-group">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" id="txBusca-pagamento" class="form-control campo-btn-busca" placeholder="Buscar por cliente, ve�culo ou forma de pagamento" />
                            <span class="input-group-btn">
                                <button id="btnBusca-pagamento" class="btn btn-info campo-btn-busca" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 table-overflow">
                    <table class="table table-bordered table-striped table-responsive">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Cliente</th>
                                <th>Transportador</th>
                                <th>Data</th>
                                <th>Token</th>
                                <th>Valor (R$)</th>
                                <th>Repassado (R$)</th>
                                <th>Falta (R$)</th>
                                <th>A��es</th>
                            </tr>
                        </thead>
                        <tbody id="tabela-pagamentos-admin">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</article>