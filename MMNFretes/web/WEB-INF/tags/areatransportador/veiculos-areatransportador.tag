<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-9" id="veiculos-area-transportador">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="text-center">Veículos</h1>
        </div>
        <div class="panel-body">

            <div class="row">
                
                <div class="col-sm-4">
                    <img id="img-preview" src="resources/img/checked_truck-512.png" class="img-thumbnail" alt="Cinque Terre" width="720" height="720">
                    <span>
                        <input type="text" id="fake-file-input-name-veiculos" disabled="disabled" placeholder="Nenhuma imagem selecionada" class="form-control input-sm">
                        <form id="form-img" runat="server" method="post" enctype="multipart/form-data" action="">
                            <input id="upload" class="col-sm-12" accept="image/png, image/jpeg, image/gif" style="display: none" type="file" name="file">
                            <i class="fa_icon icon-upload-alt"></i>Editar Imagem
                        </form>
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-sm" id="fake-file-button-browse-veiculos" type="button">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </button>
                        </span>
                    </span>
                </div>

                <div class="col-sm-8">
                    <form role="form" id="formulario-info-veiculo" method="POST" action="">
                        <div class="row">

                            <div class="form-group col-sm-6" hidden>
                                id aqui
                                <input type="text" id="txID" name="id">
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="text" id="txDescricao_veiculo" name="descricao" maxlength="100" class="form-control" placeholder="Nome do Veículo" required>
                            </div>
                            <div class="form-group col-sm-2">
                                <input type="number" name="capacidade" id="txCapacidade_veiculo" class="form-control" placeholder="Cap." required>
                            </div>
                            <div class="form-group col-sm-4">
                                <select name="tipos_carga_id" id="cbTipo_carga" class="form-control"required>
                                    <option disabled selected>Tipo Carga</option>
                                    <c:forEach var="tipo_carga" items="${tipos_carga}">
                                        <option value="${tipo_carga.id}"> ${tipo_carga.descricao} </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <select name="categorias_veiculos_id" id="cbCategoria_veiculo" class="form-control"required>
                                    <option disabled selected>Categoria do veículo</option>
                                    <c:forEach var="categoria" items="${categorias_veiculos}">
                                        <option value="${categoria.id}"> ${categoria.descricao} </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-sm-6">
                                <select name="carrocerias_id" id="cb_carroceria" class="form-control"required>
                                    <option disabled selected>Carroceria</option>
                                    <c:forEach var="carroceria" items="${carrocerias}">
                                        <option value="${carroceria.id}"> ${carroceria.descricao} </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <input name="preco_frete" id="txPreco_frete_veiculo" type="number" class="form-control" placeholder="Valor (R$)" required>
                            </div>
                            <div class="form-group col-sm-6">
                                <input disabled selected type="text" class="form-control" placeholder="Kilômetro" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        Rastreador
                                        <div class="material-switch pull-right">
                                            <input name="rastreador" id="ck_rastreador_veiculo" type="checkbox"/>
                                            <label for="rastreador" class="label-primary"></label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="btn-group col-sm-4">
                                <button type="button" id="btnExcluir-veiculo" data-toggle="modal" data-target="#mensagem-sn" class="btn btn-danger col-sm-12">Excluir</button>
                            </div>
                            <div class="btn-group col-sm-8">
                                <button type="button" id="btnAdicionar-veiculo" class="btn btn-primary col-sm-12">Adicionar</button>
                            </div>
                        </div>
                </div>
                </form>
            </div>
            <hr/>
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="text-primary">Lista Veículos</h2>
                    <div id="custom-search-input">
                        <div class="input-group col-md-6">
                            <input type="text" id="txBusca-veiculo"  class="form-control campo-btn-busca" placeholder="Buscar veículo" />
                            <span class="input-group-btn">
                                <button class="btn btn-info campo-btn-busca" id="btBuscar-veiculo" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div><br/>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="tab-veiculos-col-veiculo">Veículo</th>
                                <th>Capacidade</th>
                                <th>Categoria</th>
                                <th>Carroceria</th>
                                <th>Rastreador</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="tabela-veiculos">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
