<article>
    <div class="row">    
        <div class="col-md-12" id="historico-area-transportador">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Histórico</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <input type="text" id="txPesquisa-historico" class="form-control campo-btn-busca" placeholder="Buscar por cliente ou veículo" />
                                    <span class="input-group-btn">
                                        <button id="btnBuscar-historico" class="btn btn-info campo-btn-busca" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 table-overflow">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Data</th>
                                        <th>Cliente</th>
                                        <th>Veículo</th>
                                        <th>Distância</th>
                                        <th>Valor</th>
                                    </tr>
                                </thead>
                                <tbody id="tabela-historico">
   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>