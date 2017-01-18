<article>
    <div class="row">   
        <div class="col-md-12" id="pendentes-area-transportador">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Pendentes</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-8 form-group">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <input type="text" class="form-control campo-btn-busca" placeholder="Buscar por cliente, veículo ou forma de pagamento" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info campo-btn-busca" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2 form-group">
                            <label>
                                <select class="form-control pull-right">
                                    <option>Selecione</option>
                                    <option>Perto</option>
                                    <option>Longe</option>
                                </select>
                            </label>
                        </div>
                        <div class="col-sm-2 form-group">
                            <label>
                                <select class="form-control pull-right">
                                    <option>Selecione</option>
                                    <option>Maior Valor</option>
                                    <option>Menor Valor</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 table-overflow">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Status</th>
                                        <th>Cliente</th>
                                        <th>Data</th>
                                        <th>Veículo</th>
                                        <th>Distância</th>
                                        <th>Valor</th>
                                        <th>Ações </th>
                                    </tr>
                                </thead>
                                <tbody id="tabela-cotacoes">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
