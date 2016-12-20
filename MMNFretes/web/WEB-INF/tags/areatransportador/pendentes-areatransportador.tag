<div class="col-md-12" id="pendentes-area-transportador">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Pendentes</h2>
        </div>
        <div class="panel-body">
            <div id="custom-search-input">
                <div class="input-group col-md-8">
                    <input type="text" class="form-control campo-btn-busca" placeholder="Buscar por cliente, veículo ou forma de pagamento" />
                    <span class="input-group-btn">
                        <button class="btn btn-info campo-btn-busca" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
            <div class="row">
                <br>
                <div class="col-sm-12 table-overflow">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Status</th>
                                <th>Cliente</th>
                                <th>Data</th>
                                <th>Veículo</th>
                                <th>Pagamento</th>
                                <th>Valor</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="tabela-cotacoes">
                        
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