<%-- 
    Document   : config
    Created on : 10/12/2016, 13:03:16
    Author     : Marcos Vinícius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container">
            <div class="col-md-6">
                <h2> Configurador </h2>  
                <label>${mensagem}</label>
            </div>

            <div class="col-md-12" id="div-form">
                <form action="/gcfretes/autconfig" id="form-config" method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="h5"> Usuário </label>
                            <input type="text" class="form-control" name="usuario"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-12">
                            <lable class="h5"> Senha </lable>
                            <input type="password" class="form-control" name="senha"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-2">
                            <input type="button" id="btnLogin" class="btn btn-primary" value="Autenticar"/>
                        </div>
                    </div>
                </form>
            </div>

            <div id="configs" class="col-md-12">

                <div class="row">
                    <div class="col-md-2">
                        <label class="h4"> Configuração </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">

                        <select id="cbConfigs" class="form-control">
                            <option selected="true"> Selecione a configuração </option>
                            <c:forEach var="config" items="${configs}">
                                <option value="${config.id}"> ${config.config} </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-8">
                        <label class="h4" id="lbDescricao"> </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="h4"> Valor </label>
                        <input type="text" class="form-control" id="txValor"/>
                    </div>
                </div>

                <br/>
                <input type="button" id="btnSalvar" class="btn btn-primary" value="Salvar"/>
            </div>


        </div>


        <!-- Scripts da página -->
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/modal-centralizado.js"></script>
        <!-- Scripts de mascara para inputs -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <script src="resources/js/configurador.js"></script>
    </body>
</html>
