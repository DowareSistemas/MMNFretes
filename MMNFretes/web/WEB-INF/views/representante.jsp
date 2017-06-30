<%-- 
    Document   : representante
    Created on : 04/04/2017, 00:14:25
    Author     : emers
--%>

<!-- ***************************************************************************

ATENÇÃO BACK-END: A estrutura se repetirá apartir do comentário "PRODUTO" cada produto
deve conter na "data-target" do modal de descrição a "id do produto" para evitar
que o conteúdo de descrição seja o mesmo para totos os produtos na tela.

**************************************************************************** -->

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
        <!-- Jquery Necessário aqui -->
        <script src="resources/js/jquery.js"></script>

        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
            </header>
            <main>
                <div class="jumbotron">
                    <h1 class="text-center text-uppercase">${nomeRepresentante}</h1>
                    <p class="text-center text-muted">Seja bem vindo, conheça meus produtos logo abaixo!</p>
                </div>

                <div class="row">
                    <c:forEach var="produto" items="${produtos}">
                        <!-- PRODUTO -->
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 form-group">
                            <div class="panel panel-primary">
                                <div class="panel-body row">
                                    <div class="col-xs-12 form-group">
                                        <button class="btn btn-info btn-xs pull-right" data-toggle="modal" data-target="#${produto.id}">
                                            <i class="glyphicon glyphicon-info-sign"></i>
                                        </button>

                                        <img id="imgProduto${produto.id}" src="resources/img/logo.png" alt="Imagem Produto" class="img-rounded center-block" height="200">

                                        <c:if test="${produto.foto ne null}">
                                            <script>
                                                var url = '/gcfretes/produto_path?produto_id=${produto.id}';
                                                $.get(url, function (response)
                                                {
                                                    $('#imgProduto${produto.id}').attr('src',
                                                            response);
                                                });
                                            </script>
                                        </c:if>

                                    </div>
                                    <div class="col-xs-12">
                                        <h2>${produto.nome}</h2>
                                    </div>
                                    <div class="col-xs-12">
                                        <h2>
                                            <small>
                                                <fmt:formatNumber value="${produto.preco}"
                                                                  minFractionDigits="2"
                                                                  maxFractionDigits="2"
                                                                  type="currency"/>
                                            </small>
                                        </h2>
                                    </div>
                                    <div class="col-xs-12">
                                        <h3><small>Quantidade: ${produto.quant} <span>${produto.unidade}</span></small></h3>
                                    </div>
                                    <div class="col-xs-12">
                                        <button onclick="comprarProduto(${produto.id})" class="btn btn-success center-block">Comprar</button>
                                    </div>
                                </div>
                            </div>

                            <!-- MODAL DE DESCRIÇÃO -->
                            <div class="modal fade" id="${produto.id}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">${produto.nome}</h4>
                                        </div>
                                        <div class="modal-body">
                                            ${produto.descricao}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- PRODUTO -->
                    </c:forEach>
                </div>
            </main>
        </div>
        <!-- Scripts da página 
        ========================================================================================= -->
        <script src="resources/js/ambientes.js"></script>
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

        <script>
            function comprarProduto(produto_id)
            {
                window.location.href = '/gcfretes/produto?id=' + produto_id;
            }
        </script>
    </body>
</html>
