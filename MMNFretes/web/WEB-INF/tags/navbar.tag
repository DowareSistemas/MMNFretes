<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<script src="resources/js/mascaras.js"></script>

<!--Navbar fixa no topo-->
<div class="clearfix">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="http://localhost:8080/mmnfretes/pesquisar">GC Fretes</a>
                <button type="button" class="navbar-toggle collapsed pp-01" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <button type="button" class="navbar-toggle collapsed pp-01"  data-toggle="collapse" data-target="#collapse-filter" aria-expanded="false">
                    <span class="glyphicon glyphicon-filter"></span>
                </button>
                <button type="button" class="navbar-toggle collapsed pp-01"  data-toggle="collapse" data-target="#collapse-shopping-cart" aria-expanded="false">
                    7 <!-- Quantidade de cotações -->
                    <span class="glyphicon glyphicon-shopping-cart"></span>
                </button>
            </div>
            <!-- Collapse de nav links, forms, e outros conteúdos -->
            <div class="collapse navbar-collapse" id="bs-navbar-collapse">
                <!-- Formulário de pesquisa -->
                <form class="navbar-form form-group-sm navbar-left">
                    <div class="form-group input-group">
                        <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="tel" class="form-control mask-cep" placeholder="CEP Destino">
                    </div>
                    <div class="form-group input-group">
                        <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="tel" class="form-control mask-cep" placeholder="CEP Destino">
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Buscar</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown visible-sm visible-md visible-lg">
                        <a href="" class="dropdown-toggle" data-toggle="modal" data-target="#modal-shopping-cart">
                            12 <!-- Quantidade de cotações -->
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Entrar 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
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
                </ul>
            </div>
        </div>
    </nav>
</div>

<!-- Conteúdo de collapse e modal -->

<!-- Modal de cotações -->
<div id="modal-shopping-cart" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal conteúdo (Desktop) -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">Fechar</button>
                <h4 class="modal-title text-uppercase">Tabela de Cotações</h4>
            </div>
            <div class="modal-body overflow-310">
                <table class="table">
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
                                <h5>R$ 00000,00</h5>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger">Remover</button>
                            </td>
                        </tr>

                        <!-- Conteúdo de teste -->






                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <div class="col-sm-10 col-md-10">
                    <h6 class="pull-left text-justify">
                        Você poderá negociar valores após finalizar as cotações em sua página no painel de <abbr class="text-uppercase">pendentes</abbr>.
                        Saiba mais informações<a href=""> clicando aqui!</a>
                    </h6>
                </div>
                <div class="col-sm-2 col-md-2">
                    <button type="button" class="btn btn-success">Finalizar</button>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Collapse de cotações (Mobile) -->
<div class="visible-xs">
    <div class="collapse navbar-collapse" id="collapse-shopping-cart">
        <!-- Modal conteúdo -->
        <div class="panel-collapse pp-02">
            <div class="panel-heading">
                <div class="col-xs-9">
                    <h4 class="modal-title text-uppercase">Tabela de Cotações</h4>
                </div>
                <div class="col-xs-3">
                    <button type="button" class="btn btn-sm btn-success">Finalizar</button>
                </div>
                <div class="col-xs-12">
                    <h6 class="pull-left text-justify">
                        Você poderá negociar valores após finalizar as cotações em sua página no painel de <abbr class="text-uppercase">pendentes</abbr>.
                        Saiba mais informações<a href=""> clicando aqui!</a>
                    </h6>
                </div>
            </div>
            <div class="panel-body overflow-310">
                <table class="table">
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
                                    <span class="btn btn-lg btn-danger"><i class="glyphicon glyphicon-trash"></i></span>
                                </div>
                            </td>
                        </tr>

                        <!-- Conteúdo de teste -->
                        



                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Collapse de filtros -->
<div class="visible-xs">
    <div id="collapse-filter" class="collapse navbar-collapse">
        <!-- Modal conteúdo-->
        <div class="modal-content">

        </div>
    </div>
</div>