<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/areausuario/" prefix="areausuario"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes" %>
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
        <title>Vincular Pedido - GC Fretes</title>
    </head>
    <body>
        <!-- BARRA DE NAVEGAÇÃO -->
        <my-tags:navbar />

        <div class="container-fluid">
            <main>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th></th>
                            <th class="text-center">ID</th>
                            <th class="text-center">Cliente</th>
                            <th class="text-center">Produto</th>
                            <th class="text-center">
                                <span class="visible-xs">Qtd.</span>
                                <span class="visible-sm visible-md visible-lg">Quantidade</span>
                            </th>
                            <th class="text-center">Valor</th>
                            <th class="text-center">Valor Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"><input type="checkbox"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-lg btn-success center-block">Vincular</button>

            </main>
            <footer>

            </footer>
        </div>

        <!-- Scripts da página -->
        <script src="resources/js/ambientes.js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <script src="resources/js/navbar.js"></script>

    </body>
</html>
