<%-- 
    Document   : login
    Created on : 26/07/2016, 20:47:39
    Author     : Marcos Vinícius
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
        <title>Login-MMN Fretes</title>  
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

        <div class="container-fluid">
            <div class="col-xs-12 col-sm-5 col-md-5">
                <div class="jumbotron">
                    <div class="text-primary">
                        <h1>Criar Conta</h1>
                    </div>
                    <div class="form-group">
                        <form role="form">
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="Nome">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="Senha">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="Digite sua senha novamente">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="ANTT">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control center-block" placeholder="CPF ou CNPJ">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox">Sou um transportador</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Criar Conta</button>
                        </form>
                    </div>

                </div>
            </div>

            <div class="col-xs-12 col-sm-7 col-md-7">
                <p class="text-justify">Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.

                    Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla.

                    Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
            </div>
        </div>
    </body>
</html>
