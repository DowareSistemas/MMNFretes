
<div class="row">
    <div class="col-sm-12">
        <h2 class="text-primary">Adicionar ou editar endereços</h2>
        <div class="form-group">
            <form role="form" id="formulario-endereco" action="/mmnfretes/adicionaEndereco" method="POST">
                <div class="row">
                    <div class="form-group col-sm-2">
                        <input type="number" id="txCep" name="CEP" class="form-control" placeholder="CEP" required>
                    </div>
                    <div class="form-group col-sm-2">
                        <select class="form-control" id="cbUf" name="UF" required>
                            <option disabled selected>UF</option>
                            <option value="RJ">RJ</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-3">
                        <select class="form-control" id="cbMunicipio" name="municipio" required>
                            <option disabled selected>Município</option>
                            <option value="Volta Redonda">Volta Redonda</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-4">
                        <input type="text" id="txBairro" name="bairro" class="form-control" placeholder="Bairro/Distrito" required>
                    </div>
                    <div class="form-group col-sm-3">
                        <input type="text" id="txLogradouro" name="logradouro" class="form-control" placeholder="Logradouro/Nome" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-2">
                        <input type="number" id="txNumero" name="numero" class="form-control" placeholder="Número" required>
                    </div>
                    <div class="form-group col-sm-5">
                        <input type="text" id="txComplemento" name="complemento" class="form-control" placeholder="Complemento">
                    </div>
                </div>
                <div class="row">
                    <div class="btn-group col-sm-2">
                        <button type="button" value="0" id="btnExcluir-endereco" class="btn btn-danger col-sm-12" data-toggle="modal" data-target="#mensagem-sn">Excluir</button>
                    </div>
                    <div class="btn-group col-sm-5">
                        <button type="submit" id="btnAdicionar-endereco" class="btn btn-primary col-sm-12">Adicionar</button>
                    </div>
                </div>      
                <br/>
            </form>
        </div>
    </div>
</div><hr/>
<div class="row">
    <div class="col-sm-12">
        <h2 class="text-primary">Lista Endereços</h2>
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
            <tbody id="enderecos-items">

            </tbody>
        </table>
    </div>
</div>