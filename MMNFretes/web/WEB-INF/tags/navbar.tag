<!--Navbar fixa no topo-->
<nav class="navbar navbar-default  navbar-fixed-top">
    <div class="container">
        <div class="col-md-12">
            <div class="navbar-header">
                <h1 class="pp-04"><a class="navbar-brand pp-04" href="/gcfretes/pesquisar">GC Fretes</a></h1>
                <button type="button" class="navbar-toggle collapsed pp-01" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- Collapse da navbar -->
            <div class="collapse navbar-collapse" id="bs-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Link</a></li>
                    <li><a href="">Link</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown visible-sm visible-md visible-lg">
                        <a href="" class="dropdown-toggle" data-toggle="modal" data-target="#modal-shopping-cart">
                            <span class="badge">12</span>
                            <i class="glyphicon glyphicon-shopping-cart"></i>
                        </a>
                    </li>
                    <!-- Usuário DESLOGADO -->
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Entrar 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pp-03">
                            <li>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form action="">
                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <input type="email" class="form-control" id="txEmail" name="email">
                                            </div>
                                            <div class="form-group" action="/gcfretes/efetualogin">
                                                <label for="pwd">Senha:</label>
                                                <input type="password" class="form-control" id="txSenha" name="senha">
                                            </div>
                                            <button type="button" id="btnLogin" class="btn btn-primary btn-block">Entrar</button><hr>
                                            <div class="text-center">
                                                <button type="button" class="btn btn-link btn-sm">Esqueceu sua senha?</button>
                                            </div>
                                        </form><hr>
                                        <div class="text-center">
                                            Novo aqui ? <a href="gcfretes/paginalogin"><b class="text-uppercase">junte-se a nós</b></a>
                                        </div>
                                    </div>
                                </div>
                            </li> 
                        </ul>
                    </li>
                    <!-- Usuário LOGADO -->
                    <li class="active">
                        <a href="gcfretes/areausuario">
                            Perfil
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>
            </div> <!-- Collapse da navbar -->
        </div>
    </div>
</nav>

<!-- Modal de cotações -->
<div id="modal-shopping-cart" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal conteúdo (Desktop) -->
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-xs-12">
                        <button type="button" class="close" data-dismiss="modal">Fechar</button>
                        <h4 class="modal-title text-uppercase">Tabela de Cotações</h4>
                    </div>
                </div>
            </div>
            <div class="modal-body overflow-310">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th class="text-uppercase">Nome da Transportadora</th>
                            <th class="text-uppercase">Preço</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5 class="text-primary">Nome da Transportadora</h5>
                                    </div>
                                    <div class="col-xs-12">
                                        <p>
                                            <span class="glyphicon glyphicon-star"></span>
                                            <span class="glyphicon glyphicon-star"></span>
                                            <span class="glyphicon glyphicon-star"></span>
                                            <span class="glyphicon glyphicon-star-empty"></span>
                                            <span class="glyphicon glyphicon-star-empty"></span>
                                        </p>
                                    </div> 
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5>R$ 00000,00</h5>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <button type="button" class="btn btn-danger pull-right">Remover</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success">Finalizar</button>
            </div>
        </div> <!-- Modal conteúdo (Desktop) -->
    </div>
</div>
