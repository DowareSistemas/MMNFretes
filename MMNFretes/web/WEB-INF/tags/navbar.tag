<!--Navbar fixa no topo-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://localhost:8080/mmnfretes/pesquisar">Nome Site</a>
        </div>
        <!-- Coleção de nav links, forms, e outros conteúdos -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left">
                <div class="form-group input-group">
                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                    <input type="text" class="form-control" placeholder="CEP Origem">
                </div>
                <div class="form-group input-group">
                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                    <input type="text" class="form-control" placeholder="CEP Destino">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="btn btn-link">12 <span class="glyphicon glyphicon-shopping-cart"></span></a>
                </li>
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entrar <span class="caret"></span></a>
                    <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="">
                                        
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" id="txEmail" name="email">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="pwd">Senha:</label>
                                            <input type="password" class="form-control" id="txSenha" name="senha">
                                        </div>
                                        
                                        <button id="btnLogin" type="button" class="btn btn-primary center-block">Entrar</button><hr>
                                        
                                        <div class="text-center">
                                            <button type="button" class="btn btn-link btn-sm">Esqueceu sua senha?</button>
                                        </div>
                                    </form><hr>
                                    <div class="text-center">
                                        Novo aqui ? <a href=""><b class="text-uppercase">junte-se a nós</b></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
</nav>
