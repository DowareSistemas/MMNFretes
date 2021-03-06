<article id="enderecos">
    <div class="row">    
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Endere�os</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Gerenciar endere�os</h3>
                            <div class="form-group">
                                    <div class="row">
                                        <div hidden>
                                            <input type="number" id="txID-endereco" name="id">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>CEP:</label>
                                            <input type="tel" id="txCep" name="CEP" class="form-control mask-cep" placeholder="CEP" required>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>UF:</label>
                                            <select class="form-control" id="cbUf" name="uf" required>
                                                <option value="0" selected> Selecione </option>
                                                <!-- Adicionado dinamicamente -->
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Munic�pio:</label>
                                            <select class="form-control" id="cbMunicipio" name="municipio" required>
                                                <option value="0" selected> Selecione </option>
                                                <!-- Adicionado dinamicamente -->
                                            </select>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Bairro / Distrito:</label>
                                            <input type="text" id="txBairro" name="bairro" class="form-control" placeholder="Bairro/Distrito" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label>Logradouro / Nome:</label>
                                            <input type="text" id="txLogradouro" name="logradouro" class="form-control" placeholder="Logradouro/Nome" required>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>N�mero:</label>
                                            <input type="number" id="txNumero" name="numero" class="form-control" placeholder="N�mero" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Complemento:</label>
                                            <input type="text" id="txComplemento" name="complemento" class="form-control" placeholder="Complemento">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="button" value="0" id="btnExcluir-endereco" class="btn btn-danger">Excluir</button>
                                            <button type="button" id="btnAdicionar-endereco" class="btn btn-primary pull-right">Adicionar</button>
                                        </div>
                                    </div>      
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Lista Endere�os</h3>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>CEP</th>
                                        <th>UF</th>
                                        <th>Munic�pio</th>
                                        <th>Bairro/Distrito</th>
                                        <th>Logradouro/Nome</th>
                                        <th>N�mero</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="enderecos-items"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>