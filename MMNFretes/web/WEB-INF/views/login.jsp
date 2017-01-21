<%-- 
    Document   : login
    Created on : 26/07/2016, 20:47:39
    Author     : Marcos Vinícius
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/login/" prefix="login"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>Cadastre-se - GC Fretes</title>  
    </head>

    <body>

        <div class="container-fluid">
            <header>
                <my-tags:navbar redireciona_perfil="true"/>
                <backend:mensagem-ok id="msgUsuarioExiste" id_btnOK="btnUsrExstOK" mensagem="Já existe um usuário com o email informado. Informe outro email"/>
            </header>
            <main>
                <div class="row">
                    <div class="col-md-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h1 class="text-center">Criar conta</h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-block btn-default text-uppercase" id="usuario">Usuário</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-block btn-default text-uppercase" id="transportador">Transportador</button>
                                    </div>
                                </div><br>
                                <login:form-usuario/>
                                <login:form-transportadora/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <login:sobre/>
                        <login:singup_pay/>
                    </div>
                    <backend:mensagem-ok id_btnOK="btnOK" id="senhaIncorreta" mensagem="Usuário ou senha incorretos!" />
                </div>
            </main>
            <footer>

            </footer>
        </div>

        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/login.js"></script>
        <!-- Scripts de mascara para inputs -->

        <c:if test="${usuarioExiste eq true}">
            <script>
                $('#msgUsuarioExiste').modal('toggle');
                $('#msgUsuarioExiste').modal('show');

                $('#btnUsrExstOK').click(function ()
                {
                    window.location.href = '/gcfretes/paginalogin';
                });
            </script>
        </c:if>
    </body>
</html>
