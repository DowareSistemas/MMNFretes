<%-- 
    Document   : pesquisarfretes
    Created on : 15/08/2016, 21:41:01
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>JSP Page</title>
    </head>

    <!-- Controles de Barra de navegação -->
    <my-tags:navbar/>
    <%--<my-tags:navbar-login>--%>

    <!-- Conteudo da página -->
    <div class="container">

        <!-- Filtro de pesquisa (Desktop) -->
        <div class="col-md-2 visible-sm visible-md visible-lg">

            <!-- Filtro de pesquisa: Veículos -->
            <div class="row">
                <div class="thumbnail">
                    <div class="veiculos">
                        <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                            <span class="caret"></span>
                            Veículos 
                        </button>
                        <div class="collapse" id="veiculos">
                            <!-- Filtro de pesquisa: Veículos Pesados -->
                            <h5 class="text-muted text-uppercase text-center">Veículos Pesados</h5>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Rodotrem</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Bitrem</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Carreta LS</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Carreta</label>
                            </div>
                            <!-- Filtro de pesquisa: Veículos Médios -->
                            <h5 class="text-muted text-uppercase text-center">Veículos Médios</h5>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Bitruck</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Truck</label>
                            </div>
                            <!-- Filtro de pesquisa: Veículos Leves -->
                            <h5 class="text-muted text-uppercase text-center">Veículos Leves</h5>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Toco</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> 3/4</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> V.L.C</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> V.U.C.</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filtro de pesquisa: Carrocerias -->
            <div class="row">
                <div class="thumbnail">
                    <div class="carrocerias">
                        <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                            <span class="caret"></span>
                            Carrocerias 
                        </button>
                        <div class="collapse" id="Carrocerias">
                            <h5 class="text-muted text-uppercase text-center">Tipos de carrocerias</h5>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Baú</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Sider</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Caçamba</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Grade Baixa</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Filtro de pesquisa: Carrocerias -->

            <!-- Filtro de pesquisa: Rastreador -->
            <div class="row">
                <div class="thumbnail">
                    <div class="rastreador">
                        <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                            <span class="caret"></span>
                            Rastreador 
                        </button>
                        <div class="collapse" id="Rastreador">
                            <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                            <div class="radio">
                                <label><input type="radio" name="optradio">Sim</label>
                            </div>
                            <div class="radio">
                                <label><input type="radio" name="optradio">Não</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filtro de pesquisa: Formas de Pagamento -->
            <div class="row">
                <div class="thumbnail">
                    <div class="formas-pagamento">
                        <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                            <span class="caret"></span>
                            Formas de Pagamento 
                        </button>
                        <div class="collapse" id="Formas-de-Pagamento">
                            <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Boleto Bancário</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Cartão de Crédito</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" value=""> Negociação Particular</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- Filtro de pesquisa: Veículos -->
        </div>

        <!-- Conteúdo de pesquisa -->
        <div class="col-md-10 visible-sm visible-md visible-lg">
            <div class="thumbnail">
                <div class="row">
                    <my-tags:conteudo-pesquisar/>
                </div>
            </div>
        </div>
        <div class="row">
            <my-tags:conteudo-pesquisar/>
        </div>



        <div class="thumbnail visible-sm visible-md visible-lg">
            <div class="row">
                <div class="col-sm-12 col-lg-2 col-md-2">
                    <div class="ratings">
                        <img src="resources/img/checked_truck-512.png" class="img-thumbnail" alt="Cinque Terre" width="95">
                    </div>
                </div>
                <div class="col-sm-12 col-lg-3 col-md-3">
                    <div class="row">
                        <h4 class="text-primary">Nome da Transportadora</h4>
                    </div>
                    <div class="row">
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-5 col-md-5"><br>
                    <div class="row">
                        <div class="col-sm-12 col-lg-4 col-md-4">
                            <label for="sel1">Veículo Pesado: </label>
                            <p>Carreta</p>
                        </div>
                        <div class="col-sm-12 col-lg-4 col-md-4">
                            <label for="sel1">Tipo de Carroceria: </label>
                            <p>Baú</p>
                        </div>
                        <div class="col-sm-12 col-lg-4 col-md-4">
                            <label for="sel1">Rastreador: </label>
                            <p>Não</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-lg-2 col-md-2">
                    <div class="row">
                        <h4 class="text-center">R$ 00,00</h4>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary btn-sm center-block">Adicionar</button>
                    </div>
                </div>
            </div>
        </div>




    </div>
</div>

<!-- Scripts da página -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-form.js"></script>
<script src="resources/js/bootstrap.js"></script>

</html>
