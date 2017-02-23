<%-- 
    Document   : administrador
    Created on : 30/12/2016, 20:21:25
    Author     : emers
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>
<%@taglib tagdir="/WEB-INF/tags/admin/" prefix="admin"%>
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
        <title>Administrador - GC Fretes</title>
    </head>
    <body>
    <body>
        <div class="container-fluid">
            <header>
                <my-tags:navbar redireciona_perfil="true"/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-aside">
                                <button class="btn btn-primary btn-block" type="button" id="btnPagamentos">Pagamentos</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnFinanceiro">Financeiro</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnGerencia-usuarios">Usuários</button><br>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <main>
                <div class="aside-fixed-main">
                    <!-- Conteúdo da página -->
                    <admin:pagamentos/>
                    <admin:Financeiro/>
                    <admin:gerencia-usuarios/>
                </div>
            </main>
            <footer>

            </footer>
        </div>

        <!-- Scripts da página 
        ========================================================================================= -->
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <!-- Scripts de login 
        ========================================================================================= -->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
        <script src="resources/js/admin.js"></script>
        <script src="resources/js/login.js"></script>
        <script src="resources/js/navbar.js"></script>
    </body>
</html>
