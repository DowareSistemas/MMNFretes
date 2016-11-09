<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<article>
    <div class="row">    
        <div class="col-md-12" id="veiculos-area-transportador">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Ve�culos</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <img id="img-preview" src="resources/img/checked_truck-512.png" class="img-thumbnail img-areatransportador" alt="Imagem do ve�culo" width="300" height="306">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <input type="text" id="fake-file-input-name-veiculos" disabled="disabled" placeholder="Nenhuma imagem selecionada" class="form-control">
                                        <!--  Formul�rio Foto -->
                                        <form id="form-img" runat="server" method="post" enctype="multipart/form-data" action="">
                                            <input id="upload" class="col-md-12" accept="image/png, image/jpeg, image/gif" style="display: none" type="file" name="file">
                                        </form>
                                        <!-- Formul�rio Foto: FIM -->
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" id="fake-file-button-browse-veiculos" type="button">
                                                <i class="glyphicon glyphicon-pencil"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <!--  Formulario Info  -->
                            <form role="form" id="formulario-info-veiculo" method="GET">
                                <div class="row">
                                    <div hidden>
                                        <input type="text" id="txID" name="id">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>Ve�culo:</label>
                                        <input type="text" id="txDescricao_veiculo" name="descricao" maxlength="100" class="form-control" title="Nome do ve�culo" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Capacidade:</label>
                                        <input type="tel" name="capacidade" id="txCapacidade_veiculo" class="form-control mask-capacidade" title="Capacidade" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Carga:</label>
                                        <select name="tipos_carga_id" id="cbTipo_carga" class="form-control" required title="Tipo de carga">
                                            <c:forEach var="tipo_carga" items="${tipos_carga}">
                                                <option value="${tipo_carga.id}"> ${tipo_carga.descricao} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Categoria:</label>
                                        <select name="categorias_veiculos_id" id="cbCategoria_veiculo" class="form-control" required title="Categoria de ve�culos">
                                            <c:forEach var="categoria" items="${categorias_veiculos}">
                                                <option value="${categoria.id}"> ${categoria.descricao} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label>Carroceria:</label>
                                        <select name="carrocerias_id" id="cb_carroceria" class="form-control" required title="Carroceria">
                                            <c:forEach var="carroceria" items="${carrocerias}">
                                                <option value="${carroceria.id}"> ${carroceria.descricao} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Valor Kil�metro:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">R$</span>
                                            <input name="preco_frete" id="txPreco_frete_veiculo" type="tel" class="form-control mask-valor" title="Valor por quil�metro" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">

                                    </div>
                                    <div class="form-group col-md-6">

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <button type="button" id="btnExcluir-veiculo" data-toggle="modal" data-target="#mensagem-sn" class="btn btn-danger">Excluir</button>
                                        <button type="button" id="btnAdicionar-veiculo" class="btn btn-primary">Adicionar</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                Rastreador
                                                <div class="material-switch pull-right">
                                                    <input name="rastreador" id="ck_rastreador_veiculo" teyp="checkbox"/>
                                                    <label for="rastreador" class="label-primary"></label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </form>
                            <!-- Formulario Info: FIM -->
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-primary">Lista Ve�culos</h2>
                            <div id="custom-search-input">
                                <div class="input-group col-md-6">
                                    <input type="text" id="txBusca-veiculo"  class="form-control campo-btn-busca" placeholder="Buscar ve�culo" />
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
                                        <th class="tab-veiculos-col-veiculo">Ve�culo</th>
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
    </div>
</article>
