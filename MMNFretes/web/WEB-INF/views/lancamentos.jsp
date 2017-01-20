<%-- 
    Document   : lancamentos
    Created on : 12/01/2017, 21:51:43
    Author     : emers
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>
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
        <title>Lançamentos - GC Fretes</title>
    </head>
    <body>      
        <div class="container-fluid">
            <header>
                <my-tags:navbar redireciona_perfil="false"/>
                <pesquisarfretes:criarconta-entrar/>
                <pesquisarfretes:pesquisar-mapa/>
            </header>
            <main>
                <section>
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="alert alert-info fade in">
                                <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                                Saiba mais informações<a href=""> clicando aqui!</a>
                            </div>
                        </div>
                    </div>
                </section>
                <%--Resultados dos Lançamentos--%>
                <article>
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="panel panel-primary">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>Nome do Cliente:</h3><br>
                                            <strong>João das Coves</strong>
                                        </div>
                                        <div class="col-sm-12">
                                            <h3>Rota:</h3><br>
                                            <strong>Aproximadamente: 00,00 Km</strong><br> 
                                            Endereço de origem: CEP, Bairro / Distrito, Logradouro / Nome, Número, Complemento, Município, UF.<br>
                                            Endereço de destino: CEP, Bairro / Distrito, Logradouro / Nome, Número, Complemento, Município, UF.<br>
                                        </div>
                                        <div class="col-sm-12">
                                            <h3>Carga:</h3><br>
                                            <strong>
                                                Dimensões:<br>
                                                Comprimento:<br>
                                                Altura:<br>
                                                Largura:<br>
                                                Peso:<br>
                                                Quantidade de volumes:<br>
                                                Descrição:<br>
                                            </strong>
                                        </div>
                                        <div class="col-sm-12">
                                            <h3>Veículo:</h3><br>
                                            Tipo de veículo:<br>
                                            Carroceria:<br>
                                            Rastreador:<br>
                                            Forma de Pagamento:<br>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="button" class="btn btn-info" value="+ Informações">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="button" class="btn btn-primary pull-right" value="Adicionar">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <!--Fim-->
            </main>
            <footer>

            </footer>
        </div>

        <!-- Scripts da página 
        ========================================================================================= -->
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
        <script src="resources/js/pesquisarfretes.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
        <script src="resources/js/maps.js"></script>

    </body>
</html>
