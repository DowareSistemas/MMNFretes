<%-- 
    Document   : areausuario
    Created on : 28/07/2016, 20:13:03
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="perfil-areausuario" %>
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
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">MMN Fretes</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Pesquisar Fretes</a></li>
                        <li><a href="#">Sobre</a></li>
                        <li><a href="#">Anuncie</a></li>                        
                        <li><a href="#">Trabalhe Conosco</a></li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Digite seu email">
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Digite sua senha">
                        <button type="submit" class="btn btn-link">Entar</button>
                    </form>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Histórico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pendentes</a>
                        </li>
                    </ul>
                </div>
                <perfil-areausuario:perfil-areausuario></perfil-areausuario:perfil-areausuario>
            </div>
        </div>
</body>
</html>
