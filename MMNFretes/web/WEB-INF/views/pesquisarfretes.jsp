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
                        <form class="form-inline">
                            <button type="button" class="btn btn-success">Pesquisar CEP</button>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control"placeholder="CEP Origem">
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control"placeholder="CEP Destino">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                            <button type="submit" class="btn btn-default pull-right">Filtrar <span class="glyphicon glyphicon-filter" aria-hidden="true"></span></button>
                        </form>
                    </div>
                    <div class="panel-body">
                        Filtros!
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
    </body>
</html>
