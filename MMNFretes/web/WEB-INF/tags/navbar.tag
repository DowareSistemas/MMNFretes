<!--Navbar fixa no topo-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
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
        <!-- Cole��o de nav links, forms, e outros conte�dos -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="CEP Origem">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="CEP Destino">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="">Buscar CEP</a></li>
                <li><a href="">Sobre</a></li>
                <li class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entrar <span class="caret"></span></a>
                    <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="/mmnfretes/efetuaLogin">
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" name="email">
                                        </div>
                                        <div class="form-group" action="/mmnfretes/efetuaLogin">
                                            <label for="pwd">Senha:</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1" name="senha">
                                        </div>
                                        <button type="submit" class="btn btn-primary center-block">Entrar</button><hr>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-link btn-sm">Esqueceu sua senha?</button>
                                        </div>
                                    </form><hr>
                                    <div class="text-center">
                                        Novo aqui ? <a href=""><b class="text-uppercase">junte-se a n�s</b></a>
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