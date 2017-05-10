<%-- 
    Document   : representacoes
    Created on : 19/03/2017, 22:18:51
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
        <title>Representações - GC Fretes</title>
    </head>
    <body>      
        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
                <backend:confirmar-compra-produto/>
            </header>
            <main>
                <header>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <input type="text" id="txPesquisa-representacao" class="form-control" placeholder="Buscar" />
                                    <span class="input-group-btn">
                                        <button type="button" id="btnBuscar-representacao" class="btn btn-info">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <article>

                    <div class="row">

                        <!-- RESULTADOS -->
                        <div class="col-md-12" id="resultado-representacoes">
                            <div class="panel panel-default">

                                <c:forEach var="representante" items="${representantes}">
                                    <!-- REPRESENTANTES -->
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4 col-md-2">
                                                <img src="resources/img/img-text.jpg" alt="Imagem Representante" class="img-thumbnail img-responsive">
                                            </div>
                                            <div class="col-xs-12 col-sm-5 col-md-8">
                                                <h2>${representante.nome}</h2>
                                                <h2 class="visible-sm visible-md visible-lg"><small></small></h2>
                                            </div>
                                            <div class="col-sm-3 col-md-2">
                                                <div class="row">
                                                    <div class="col-xs-6 col-sm-12 form-group">
                                                        <button class="btn btn-info btn-block" onclick="exibirProdutosRepresentante(${representante.id})" data-toggle="collapse" data-target="#alguns-produtos">Alguns Produtos</button>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-12 form-group">
                                                        <button class="btn btn-primary btn-block">Conhecer</button>
                                                    </div>   
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- REPRESENTANTES - FIM -->
                                </c:forEach>

                                <!-- PRODUTOS -->
                                <div class="panel-footer">
                                    <div id="alguns-produtos" class="collapse">
                                        <div class="row" id="produtos-representante">
                                              <!-- exibicaoprodutos-representante.jsp -->
                                        </div>
                                    </div>
                                </div><!-- PRODUTOS - FIM -->
                            </div>
                        </div><!-- RESULTADOS - FIM -->
                    </div>
                </article>
            </main>
            <footer>

            </footer>
        </div>

        <!-- Scripts da página 
        ==================================================================== -->
        <script src="resources/js/ambientes.js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <!-- Scripts de mascara para inputs 
        ==================================================================== -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <!-- Scripts de login 
        ==================================================================== -->
        <script src="resources/js/login.js"></script>
        <script src="resources/js/navbar.js"></script>
        <script src="resources/js/representacoes.js"></script>
    </body>
</html>
