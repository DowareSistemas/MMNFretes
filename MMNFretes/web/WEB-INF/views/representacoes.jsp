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

                                <!-- REPRESENTANTES -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-2">
                                            <img src="resources/img/img-text.jpg" alt="Imagem Representante" class="img-thumbnail img-responsive">
                                        </div>
                                        <div class="col-xs-12 col-sm-5 col-md-8">
                                            <h2>Representante</h2>
                                            <h2 class="visible-sm visible-md visible-lg"><small>Causae expetendis an ius. Mel no mazim sanctus. Oblique singulis te est. Odio elit wisi pro cu.</small></h2>
                                        </div>
                                        <div class="col-sm-3 col-md-2">
                                            <div class="row">
                                                <div class="col-xs-6 col-sm-12 form-group">
                                                    <button class="btn btn-info btn-block" data-toggle="collapse" data-target="#alguns-produtos">Alguns Produtos</button>
                                                </div>
                                                <div class="col-xs-6 col-sm-12 form-group">
                                                    <button class="btn btn-primary btn-block">Conhecer</button>
                                                </div>   
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- REPRESENTANTES - FIM -->

                                <!-- PRODUTOS -->
                                <div class="panel-footer">
                                    <div id="alguns-produtos" class="collapse">
                                        <div class="row">
                                            <!-- ATENÇÃO: Conteudo visualisado dinamicamente Phones (<768px) 3 PRODUTOS, Tablets (≥768px) 4 PRODUTOS, Desktops (≥1200px)6 PRODUTOS -->

                                            <!-- PRODUTO 1 -->
                                            <div class="visible-xs visible-sm visible-md visible-lg" id="produto-1">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- PRODUTO 2 -->
                                            <div class="visible-xs visible-sm visible-md visible-lg" id="produto-2">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- PRODUTO 3 -->
                                            <div class="visible-xs visible-sm visible-md visible-lg" id="produto-3">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- PRODUTO 4 -->
                                            <div class="visible-sm visible-md visible-lg" id="produto-4">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- PRODUTO 5 -->
                                            <div class="visible-md visible-lg" id="produto-5">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- PRODUTO 6 -->
                                            <div class="visible-md visible-lg" id="produto-6">
                                                <div class="col-sm-3 col-lg-2 form-group">
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-12">
                                                            <img src="resources/img/img-text.jpg" alt="Imagem Produto" class="img-rounded img-responsive">
                                                        </div>
                                                        <div class="col-xs-7 col-sm-12">
                                                            <h4>Nome Produto</h4>
                                                            <h4 class="text-muted">R$ 000,00</h4>
                                                            <p>Quantidade: 000 Und</p>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-success btn-block">Comprar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div><!-- PRODUTOS - FIM -->
                            </div>
                        </div><!-- RESULTADOS - FIM -->
                    </div>
                </article>

                <!-- MODELO DE APRESENTAÇÃO ANTIGO -->
                <article>
                    <c:forEach var="resultado" items="${resultados}">
                        <div class="row">
                            <div class="col-sm-2">
                                <c:if test="${resultado.foto_path eq 'not_localized'}">
                                    <img class="img-thumbnail" src="resources/img/logo.png" alt="Imagem Repreentação" width="277" height="107">
                                </c:if>

                                <c:if test="${resultado.foto_path ne 'not_localized'}">
                                    <img class="img-thumbnail" src="${resultado.foto_path}" alt="Imagem Repreentação" width="277" height="107">
                                </c:if>
                            </div>
                            <div class="col-sm-8">
                                <h3>${resultado.produto.nome}</h3>
                                <h3>
                                    <small>
                                        ${resultado.produto.descricao}
                                    </small>
                                </h3>
                            </div>
                            <div class="col-sm-2">
                                <div class="row">
                                    <div class="col-sm-12">
                                        R$ <fmt:formatNumber maxFractionDigits="2" value="${resultado.produto.preco}" minFractionDigits="2"/>
                                    </div>
                                    <div class="col-sm-12">
                                        <button type="button" class="btn btn-success">Comprar</button>
                                    </div>

                                </div>
                            </div>                        
                        </div>
                    </c:forEach>
                </article><!-- MODELO DE APRESENTAÇÃO ANTIGO - FIM -->

            </main>
            <footer>

            </footer>
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