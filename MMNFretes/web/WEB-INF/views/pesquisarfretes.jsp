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
    <body>
        <my-tags:navbar/>
        <%--<my-tags:navbar-login>--%>
        <div class="container">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-group btn-success">Pesquisar CEP</button>
                                    </div>
                                    <div class="input-group">
                                        <input type="text" class="form-control"placeholder="CEP Origem">
                                    </div>
                                    <div class="input-group">
                                        <input type="text" class="form-control"placeholder="CEP Destino">
                                    </div>
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-default pull-right">Filtrar <span class="glyphicon glyphicon-filter" aria-hidden="true"></span></button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-sm-12">
                            <div class="row">
                                <h3 class="text-primary">Veículos</h3>
                                <div class="col-sm-4">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle pull-left" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            Pesados
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenu1">
                                            <li><a><label><input type="checkbox" value=""> Rodotrem</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> Bitrem</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> Carreta LS</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> Carreta</label></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle center-block" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            Médios
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <li><a><label><input type="checkbox" value=""> Bitruck</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> Truck</label></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle pull-right" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            Leves
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                                            <li><a><label><input type="checkbox" value=""> Toco</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> 3/4</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> V.L.C.</label></a></li>
                                            <li><a><label><input type="checkbox" value=""> V.U.C.</label></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h3 class="text-primary">Carroceria</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        Conteudo!
                    </div>
                </div>
            </div>

            <!-- Navbar fixed bottom -->
            <div class="navbar navbar-default navbar-fixed-bottom" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Project name</a>
                    </div>
                    <div class="navbar-collapse collapse">

                    </div><!--/.nav-collapse -->
                </div><!--/.container -->
            </div>
        </div>

        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
    </body>
</html>
