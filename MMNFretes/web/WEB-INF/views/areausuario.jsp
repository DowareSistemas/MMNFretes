<%-- 
    Document   : areausuario
    Created on : 28/07/2016, 20:13:03
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="col-sm-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div id="custom-search-input">
                                <div class="input-group col-md-12">
                                    <input type="text" class="form-control input-lg" placeholder="Buscar endereço" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info btn-lg" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <h2 class="text-center text-primary">Minhas Informações</h2><hr>
                                    <form role="form">
                                        <div class="form-group col-sm-6">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <button type="button" class="bottom-right btn btn-link col-sm-offset-11">Editar</button>
                                    </form>
                                </div>
                            </div>
                            <h3 class="text-primary">Meus Endereços</h3><hr>
                            <div class="form-group">
                                <form role="form">
                                    <div class="row">
                                        <div class="form-group col-sm-3">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-1">
                                            <select class="form-control" id="sel1">
                                                <option>1</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <select class="form-control" id="sel1">
                                                <option>1</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-2">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <input type="text" class="form-control" placeholder="Text input">
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-default col-sm-2">Default</button>
                                    <button type="button" class="btn btn-primary col-sm-5">Primary</button>
                                </form>
                            </div>
                            <div class="well col-sm-12 table-overflow">
                                <h3>Tabelas + informações</h3>
                                <table class="table">
                                    <thead>Títulos da tabela</thead>
                                    <tbody>Conteúdo da tabela</tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
