
<!--Navbar fixa no topo-->
<nav class="navbar navbar-default  navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="row">
                <div class="col-xs-6">
                    <h1 class="navbar-logo navbar-logo-xs">
                        <a id="link-nav-pesquisar" href="">
                            <img src="resources/img/logo.png" width="42" height="42">
                        </a>
                    </h1>
                </div>
                <div class="col-xs-6">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
        </div>
        <!-- Collapse da navbar -->
        <div class="collapse navbar-collapse" id="bs-navbar-collapse">
            <ul class="nav navbar-nav">
                <li id="li-lancamentos"><a id="link-lancamentos-nav" href="">Oportunidades</a></li>
                <li id="li-representacoes"><a id="link-lancamentos-nav" href="/gcfretes/representacoes">Representa��es</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li id="btnVisualizaCotacoes" class="dropdown">
                    <a href="" class="dropdown-toggle" data-toggle="modal" data-target="#modal-lista-cotacoes">
                        <span class="badge" id="countCotacoes">0</span>
                        <i class="glyphicon glyphicon-shopping-cart"></i>
                    </a>
                </li>
                <!-- Usu�rio LOGADO -->
                <li  id="li-logado">
                    <a href="paginaperfil">
                        Perfil
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li id="li-sair">
                    <a href="loggout">
                        Sair
                        <span class="sr-only"></span>
                    </a>
                </li>
                <!-- Usu�rio DESLOGADO -->
                <li class="dropdown" id="li-deslogado">
                    <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Entrar 
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pp-03">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" id="txEmail" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="pwd">Senha:</label>
                                            <input type="password" class="form-control" id="txSenha" name="senha">
                                        </div>
                                        <button type="button" id="btnLogin" class="btn btn-primary btn-block">Entrar</button><hr>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-link btn-sm">Esqueceu sua senha?</button>
                                        </div>
                                    </form><hr>
                                    <div class="text-center">
                                        Novo aqui ? <a href="paginalogin"><b class="text-uppercase">junte-se a n�s</b></a>
                                    </div>
                                </div>
                            </div>
                        </li> 
                    </ul>
                </li>
            </ul>
        </div> <!-- Collapse da navbar -->
    </div>
</nav>

<!-- Modal de cota��es -->
<div id="modal-lista-cotacoes" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal conte�do (Desktop) -->
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-xs-12">
                        <button type="button" class="close" data-dismiss="modal">Fechar</button>
                        <h4 class="modal-title text-uppercase">Tabela de Cota��es</h4>
                    </div>
                </div>
            </div>
            <div class="modal-body overflow-310">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th class="text-uppercase">Nome da Transportadora</th>
                            <th class="text-uppercase">Ve�culo</th>
                            <th class="text-uppercase">Pre�o</th>
                        </tr>
                    </thead>
                    <tbody id="tabelaCotacoesAtivas">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnFinalizarCotacao" class="btn btn-success">Finalizar</button>
            </div>
        </div> <!-- Modal conte�do (Desktop) -->
    </div>
</div>
