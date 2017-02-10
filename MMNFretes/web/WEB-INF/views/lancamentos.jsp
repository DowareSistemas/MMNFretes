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
            </header>
            <main>
                <%--Resultados dos Lançamentos--%>
                <article>
                    <div class="row">
                        <div class="col-xs-12 ">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <p>Origem: <strong class="pull-right">Volta Redonda, RJ</strong></p>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>Destino: <strong class="pull-right">Barra Mansa, RJ</strong></p>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>Dimensões: <strong class="pull-right">00,00 X 00,00 X 00,00 metros</strong></p>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>Peso: <strong class="pull-right">00,00 Kg</strong></p>
                                        </div>
                                        <div class="col-xs-6">
                                            <p>Volume(s): <strong class="pull-right">00</strong></p>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <select class="form-control">
                                                    <option>Veículo 1</option>
                                                    <option>Veículo 2</option>
                                                    <option>Veículo 3</option>
                                                </select>                                    
                                            </div>
                                            <div class="col-xs-6">
                                                <h4 class="text-primary text-center" style="margin-top: 10px;"><strong>R$ 0000,00</strong></h4>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <button class="col-xs-12 btn btn-info" data-toggle="collapse" data-target="#mais-informacoes">Mais Informações</button>
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="button" class="col-xs-12 btn btn-primary" value="Adicionar">
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div id="mais-informacoes" class="collapse">
                                        <div class="row">
                                            <div class="col-xs-8">
                                                <h4><strong>João das Coves</strong></h4>
                                            </div>
                                            <div class="col-xs-4">
                                                <h4 class="text-right">Distância: <strong>00,00 Km</strong></h4>
                                            </div>
                                            <div class="col-xs-12">
                                                <h4>Descrição:</h4>
                                            </div>
                                            <div class="col-xs-12">
                                                <p class="text-justify"><!--Desrição do lançamento-->
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                                    Curabitur rhoncus justo erat, non accumsan quam facilisis vel. 
                                                    Sed vel lacus a nulla semper bibendum. Integer rutrum iaculis efficitur. 
                                                    Duis laoreet urna sem, a pharetra libero aliquam et. 
                                                    Ut et felis eu lectus vulputate hendrerit quis vitae risus. 
                                                </p>
                                            </div>
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
