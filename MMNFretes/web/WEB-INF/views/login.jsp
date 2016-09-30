<%-- 
    Document   : login
    Created on : 26/07/2016, 20:47:39
    Author     : Marcos Vinícius
--%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>Login-MMN Fretes</title>  
    </head>

    <body>
        <my-tags:navbar/>
        <%--<my-tags:navbar-login>--%>
        <div class="container">
            <div class="col-sm-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="text-center">Criar Conta</h1>
                    </div>
                    <my-tags:form-usuario/>
                    <my-tags:form-transportadora/>
                </div>
                <input type="text" class="form-control mask-cep" placeholder="CEP Destino">
            </div>
            <my-tags:mensagem-ok id_btnOK="btnOK" id="senhaIncorreta" mensagem="Usuário ou senha incorretos!" />
            <my-tags:sobre/>
        </div>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/login.js"></script>
        <script src="resources/js/mascaras.js"></script>
    </body>
</html>
