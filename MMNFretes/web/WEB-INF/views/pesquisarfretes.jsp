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
            <nav class="navbar navbar-dark bg-primary">    
                <div id="navbar" class="navbar-collapse collapse">
                    <form class="navbar-form navbar-left">
                        <input type="text" class="form-control" placeholder="CEP Origem">
                        <input type="text" class="form-control" placeholder="CEP Destino">
                        <button type="submit" class="btn btn-default">Pesquisar</button>
                    </form>
                </div>
            </nav>
        </div>

    </div>
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery-form.js"></script>
    <script src="resources/js/bootstrap.js"></script>
</body>
</html>
