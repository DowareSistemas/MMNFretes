<%-- 
    Document   : produto
    Created on : 04/04/2017, 21:19:56
    Author     : emers
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <link href="resources/css/criarconta-entrar.css" rel="stylesheet" media="screen">
        <title>Representante - GC Fretes</title>
    </head>
    <body>
        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
            </header>
            <main>
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="row">
                            <div class="col-xs-12 form-group">
                                <img src="resources/img/img-text.jpg" class="img-rounded img-responsive" alt="Imagem Produto">
                            </div>
                            <div class="col-xs-3 form-group">
                                <img src="resources/img/img-text.jpg" class="img-rounded img-responsive" alt="Imagem Produto">
                            </div>
                            <div class="col-xs-3 form-group">
                                <img src="resources/img/img-text.jpg" class="img-rounded img-responsive" alt="Imagem Produto">
                            </div>
                            <div class="col-xs-3 form-group">
                                <img src="resources/img/img-text.jpg" class="img-rounded img-responsive" alt="Imagem Produto">
                            </div>
                            <div class="col-xs-3 form-group">
                                <img src="resources/img/img-text.jpg" class="img-rounded img-responsive" alt="Imagem Produto">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="row">
                            <div class="col-xs-12 form-group">
                                <h1>Cebola Roxa</h1>
                            </div>
                            <div class="col-xs-12 form-group">
                                <h4 class="text-justify">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing
                                    elit. Etiam ex risus, bibendum at dui et, suscipit
                                    volutpat eros. Vestibulum mattis faucibus elementum.
                                    Etiam ullamcorper purus nisl, id porta sem commodo
                                    ac. Pellentesque cursus id elit eget posuere. 
                                    Nulla vitae accumsan arcu. Aliquam et accumsan
                                    justo, a aliquet elit.
                                    <hr>
                                    <small>
                                        <span title="Logradouro / Nome">Rua Aimoré</span> -
                                        <span title="Número">15</span> 
                                        <span title="Complemento">Casa 1</span> 
                                        <span title="Bairro / Distrito">JD Cidade do Aço</span> -
                                        <span title="Município">Volta Redonda</span> -
                                        <span title="UF">RJ</span> - 
                                        <span title="CEP">27275-350</span>
                                    </small>
                                </h4>
                            </div>
                            <div class="col-xs-12 col-sm-7 col-lg-9">
                                <div class="row">
                                    <div class="col-xs-12 form-group">
                                        <label>Digite seu CEP</label>
                                        <div class="input-group col-xs-12 col-sm-6 col-lg-3">
                                            <span class="btn input-group-addon" id="btnPesquisaCepDestino"  title="Pesquisar CEP">
                                                <i class="glyphicon glyphicon-map-marker"></i>
                                            </span>
                                            <input type="text" class="form-control mask-cep" placeholder="CEP" value="">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 form-group">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#calcular-frete">Calcular Frete</button>
                                    </div>
                                    <div class="col-xs-12 form-group checkbox">
                                        <label>
                                            <input type="checkbox"> <strong>Fazer frete compartilhado!</strong>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-5 col-lg-3">
                                <div class="form-group">
                                    <h2 class="text-center">R$ 
                                        <span title="Valor">00,00</span> 

                                        <small title="Unidade">Kg</small>
                                    </h2>
                                </div>
                                <div class="form-group">
                                    <label>Quantidade</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control text-center" placeholder="Quantidade">
                                        <span class="input-group-addon"  title="Quantidade">
                                            000
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-success btn-lg btn-block">Comprar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="calcular-frete">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <table class="table table-hover table-responsive">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Transportador(a)</th>
                                            <th>Veículo</th>
                                            <th class="visible-sm visible-md visible-lg">Carroceria</th>
                                            <th class="visible-sm visible-md visible-lg">Rastreador</th>
                                            <th>Valor</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><button type="button" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-info-sign"></i></button></td>
                                            <td></td>
                                            <td></td>
                                            <td class="visible-sm visible-md visible-lg"></td>
                                            <td class="visible-sm visible-md visible-lg"></td>
                                            <td></td>
                                            <td><button type="button" class="btn btn-success btn-xs">Solicitar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!-- Scripts da página 
        ========================================================================================= -->
        <script src="resources/js/ambientes.js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <!-- Scripts de mascara para inputs 
        ========================================================================================= -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <!-- Scripts de login 
        ========================================================================================= -->
        <script src="resources/js/login.js"></script>
        <script src="resources/js/navbar.js"></script>
    </body>
</html>
