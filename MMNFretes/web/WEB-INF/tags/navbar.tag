<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/filtros-pesquisa/" prefix="filtros-pesquisa" %>

<!--Navbar fixa no topo-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/mmnfretes/pesquisar">GC Fretes</a>
            <button type="button" class="navbar-toggle collapsed pp-01" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <button type="button" class="navbar-toggle collapsed pp-01"  data-toggle="collapse" data-target="#collapse-shopping-cart" aria-expanded="false">
                7 <!-- Quantidade de cotações -->
                <span class="glyphicon glyphicon-shopping-cart"></span>
            </button>
        </div>

        <!-- Collapse da navbar -->
        <div class="collapse navbar-collapse" id="bs-navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown visible-sm visible-md visible-lg">
                    <a href="" class="dropdown-toggle" data-toggle="modal" data-target="#modal-shopping-cart">
                        12 <!-- Quantidade de cotações -->
                        <span class="glyphicon glyphicon-shopping-cart"></span>
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
                                        <div class="form-group" action="/mmnfretes/efetuaLogin">
                                            <label for="pwd">Senha:</label>
                                            <input type="password" class="form-control" id="txSenha" name="senha">
                                        </div>
                                        <button type="button" id="btnLogin" class="btn btn-primary center-block">Entrar</button><hr>
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
                <!-- Usuário LOGADO -->
                <li class="dropdown">
                    <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Nome do usuário
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pp-03">
                        <li>
                            <button type="button" class="btn btn-primary btn-block"><h5 class="text-uppercase">Perfil</h5></button>
                        </li><br>
                        <li>
                            <button type="button" class="btn btn-primary btn-block"><h5 class="text-uppercase">Pendentes</h5></button>
                        </li><br>
                        <li>
                            <button type="button" class="btn btn-primary btn-block"><h5 class="text-uppercase">Histórico</h5></button>
                        </li>
                    </ul>
                </li>
            </ul>
        </div> <!-- Collapse da navbar -->

        <!-- Collapse do shopping cart -->
        <div class="collapse navbar-collapse" id="collapse-shopping-cart">
            <ul class="nav navbar-nav visible-xs">
                <li>
                    <table class="table-responsive">
                        <div class="col-xs-12">
                            <button type="button" class="btn btn-success btn-block" style="margin-bottom: 10px">Finalizar</button>
                        </div>
                        <tbody>
                            <tr>
                                <td>
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
                                </td>
                                <td>
                                    <div class="col-xs-12">
                                        <h5>R$ 00000,00</h5>
                                    </div>
                                </td>
                                <td>
                                    <div class="col-xs-12">
                                        <span class="btn btn-danger pull-right"><i class="glyphicon glyphicon-trash"></i></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </ul>
        </div> <!-- Collapse do shopping cart -->
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