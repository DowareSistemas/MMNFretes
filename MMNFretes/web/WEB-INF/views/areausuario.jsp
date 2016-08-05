<%-- 
    Document   : areausuario
    Created on : 28/07/2016, 20:13:03
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
        <my-tags:navbar></my-tags:navbar>
        <my-tags:navbar-login></my-tags:navbar-login>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="nav-item">
                            <a class="nav-link" id="tela-perfil" href="#">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tela-historico" href="#">Histórico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tela-pendentes" href="#">Pendentes</a>
                        </li>
                    </ul>
                </div>
                <my-tags:perfil-areausuario></my-tags:perfil-areausuario>
                <my-tags:historico-areausuario></my-tags:historico-areausuario>
                <my-tags:pendentes-areausuario></my-tags:pendentes-areausuario>

            </div>
        </div>
            <script src="resources/js/jquery.js"></script>
            <script src="resources/js/jquery-form.js"></script>
            <script src="resources/js/script.js"></script>
    </body>
</html>
