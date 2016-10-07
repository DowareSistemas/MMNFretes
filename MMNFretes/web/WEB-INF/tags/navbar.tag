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

            <!-- Collapse da navbar -->
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
                </ul>
            </div> <!-- Collapse da navbar -->

            <!-- Collapse dos filtros -->
            <div class="collapse navbar-collapse" id="collapse-filter">
                <ul class="nav navbar-nav visible-xs">

                    <li class="dropdown">
                        <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Veículos 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pp-03">
                            <li>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <!-- Filtro de pesquisa: Veículos Pesados -->
                                        <h5 class="text-muted text-uppercase text-center">Veículos Pesados</h5>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Rodotrem</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Bitrem</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Carreta LS</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Carreta</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <!-- Filtro de pesquisa: Veículos Médios -->
                                        <h5 class="text-muted text-uppercase text-center">Veículos Médios</h5>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Bitruck</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Truck</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <!-- Filtro de pesquisa: Veículos Leves -->
                                        <h5 class="text-muted text-uppercase text-center">Veículos Leves</h5>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Toco</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> 3/4</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> V.L.C</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> V.U.C.</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Carrocerias 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pp-03">
                            <li>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5 class="text-muted text-uppercase text-center">Tipos de carrocerias</h5>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Baú</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Sider</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Caçamba</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Grade Baixa</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Rastreador 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pp-03">
                            <li>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                                        <div class="radio">
                                            <label><input type="radio" name="optradio">Sim</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="optradio">Não</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle text-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Formas de Pagamento 
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pp-03">
                            <li>
                                <div class="row">   
                                    <div class="col-xs-12">
                                        <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Boleto Bancário</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Cartão de Crédito</label>
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" value=""> Negociação Particular</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div> <!-- Collapse dos filtros -->

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
</div>

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
                <button type="button" class="btn btn-success">Finalizar</button>
            </div>
        </div>

    </div>
</div>