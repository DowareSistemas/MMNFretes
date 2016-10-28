<article>
    <div class="row">    
        <div class="col-md-12" id="enderecos">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Endereços</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Gerenciar endereços</h3>
                            <div class="form-group">
                                <form role="form" id="formulario-endereco" action="/mmnfretes/adicionaEndereco" method="POST">
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label>CEP:</label>
                                            <input type="tel" id="txCep" name="CEP" class="form-control" placeholder="CEP" required>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>UF:</label>
                                            <select class="form-control" id="cbUf" name="UF" required>
                                                <option value="RJ">RJ</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Município:</label>
                                            <select class="form-control" id="cbMunicipio" name="municipio" required>
                                                <option value="Volta Redonda">Volta Redonda</option>
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
                                            <label>Número:</label>
                                            <input type="tel" id="txNumero" name="numero" class="form-control" placeholder="Número" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Complemento:</label>
                                            <input type="text" id="txComplemento" name="complemento" class="form-control" placeholder="Complemento">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="button" value="0" id="btnExcluir-endereco" class="btn btn-danger" data-toggle="modal" data-target="#mensagem-sn">Excluir</button>
                                            <button type="submit" id="btnAdicionar-endereco" class="btn btn-primary pull-right">Adicionar</button>
                                        </div>
                                    </div>      
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-primary">Lista Endereços</h3>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>CEP</th>
                                        <th>UF</th>
                                        <th>Município</th>
                                        <th>Bairro/Distrito</th>
                                        <th>Logradouro/Nome</th>
                                        <th>Número</th>
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