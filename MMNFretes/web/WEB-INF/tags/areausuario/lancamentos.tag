<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>
<article id="lancamentos">
    <div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Lançamentos de Fretes</h2>
            </div>
            <div class="panel-body">
                <form>
                    <h3>Rota</h3>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <label>CEP Origem:</label>
                            <div class="form-group input-group">
                                <span class="btn input-group-addon" id="btnPesquisaCepOrigem" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                <input type="number" class="form-control mask-cep" id="txCep_origem" placeholder="CEP Origem" value="27281-440">
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <label>CEP Destino:</label>
                            <div class="form-group input-group">
                                <span class="btn input-group-addon" id="btnPesquisaCepDestino"  title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                <input type="number" class="form-control mask-cep" id="txCep_destino" placeholder="CEP Destino" value="27275-350">
                            </div>
                        </div>
                    </div>
                    <h3>Carga</h3>
                    <div class="row">
                        <div class="col-xs-12 col-md-4">
                            <label>Comprimento:</label>
                            <input type="number" class="form-control">
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <label>Altura:</label>
                            <input type="number" class="form-control">
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <label>Largura:</label>
                            <input type="number" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-4">
                            <label>Peso:</label>
                            <input type="number" class="form-control">
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <label>Volumes:</label>
                            <input type="number" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <label>Descrição:</label>
                            <textarea rows="5" class="form-control"></textarea>
                        </div>
                    </div>
                    <h3>Veículo</h3>
                    <div class="row">
                        <div class="col-sm-12">
                            <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                                Veículos 
                            </button><br>
                            <div class="collapse" id="veiculos">
                                <div class="thumbnail">
                                    <pesquisarfretes:filtro-veiculos-pesados/>
                                    <pesquisarfretes:filtro-veiculos-medios/>
                                    <pesquisarfretes:filtro-veiculos-leves/>
                                </div>
                            </div>
                            <!-- Filtro de pesquisa: Carrocerias -->
                            <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                                Carrocerias 
                            </button><br>
                            <div class="collapse" id="Carrocerias">
                                <div class="thumbnail">
                                    <pesquisarfretes:filtro-carrocerias/>
                                </div>
                            </div>
                            <!-- Filtro de pesquisa: Rastreador -->
                            <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                                Rastreador 
                            </button><br>
                            <div class="collapse" id="Rastreador">
                                <div class="thumbnail">
                                    <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                                    <pesquisarfretes:filtro-rastreador/>
                                </div>
                            </div>
                            <!-- Filtro de pesquisa: Formas de Pagamento -->
                            <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                                Formas de Pagamento 
                            </button><br>
                            <div class="collapse" id="Formas-de-Pagamento">
                                <div class="thumbnail">
                                    <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                                    <pesquisarfretes:filtro-formas-pag/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <h3>Lista Lançamentos</h3>
                <div class="table-overflow">
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
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</article>
