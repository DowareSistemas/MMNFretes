<%-- 
    Document   : representacoes
    Created on : 19/03/2017, 22:18:51
    Author     : emers
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
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
        <title>Representações - GC Fretes</title>
    </head>
    <body>      
        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
            </header>
            <main>
                <article>
                    <div class="row">
                        <div class="col-sm-2">
                            <img class="img-thumbnail" src="resources/img/logo.png" alt="Imagem Repreentação" width="277" height="107">
                        </div>
                        <div class="col-sm-8">
                            <h3>Nome do produto</h3>
                            <h3>
                                <small>
                                    Lorem ipsum dolor sit amet, mutat fastidii percipit
                                    eos et, id graeci reformidans efficiantur usu.
                                    At zril nobis mei, option inermis vix ad. Eu 
                                    vix soleat labores copiosae. Eam te eius saperet
                                    facilis, vis nusquam abhorreant at. Per aeterno
                                    facilisi repudiandae ei, pri ne sumo lorem.
                                </small>
                            </h3>
                        </div>
                        <div class="col-sm-2">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3>R$ 000,00</h3>
                                </div>
                                <div class="col-sm-12">
                                    <button type="button" class="btn btn-success">Comprar</button>
                                </div>

                            </div>
                        </div>                        
                    </div>
                </article>
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
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
        <script src="resources/js/navbar.js"></script>
    </body>
</html>