<article>
    <div class="row">    
        <div class="col-md-12" id="historico">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Histórico</h2>
                </div>
                <div class="panel-body">
                    <div class="row">    
                        <div class="col-md-12">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <input type="text" id="txPesquisa-historico" class="form-control" placeholder="Buscar por transportador ou veículo" />
                                    <span class="input-group-btn">
                                        <button type="button" id="btnBuscar-historico" class="btn btn-info">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-12 table-overflow">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Token</th>
                                        <th>Data</th>
                                        <th>Transportador</th>
                                        <th>Veículo</th>
                                        <th>Distância</th>
                                        <th>Valor (R$)</th>
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