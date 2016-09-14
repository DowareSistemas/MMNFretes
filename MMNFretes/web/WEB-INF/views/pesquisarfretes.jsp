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
                                <button class="btn btn-default pull-right" type="button" data-toggle="collapse" data-target="#filtro-pesquisar" aria-expanded="false" aria-controls="collapseExample">
                                    Filtrar
                                    <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                                </button>
                            </div>
                            <div class="collapse" id="filtro-pesquisar">
                                <div class="card card-block">
                                    <my-tags:filtro-pesquisar/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><br>
                <my-tags:conteudo-pesquisar/>
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
