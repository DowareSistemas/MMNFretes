<%-- 
    Document   : pesquisarfretes
    Created on : 15/08/2016, 21:41:01
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/filtros-pesquisa/" prefix="filtros-pesquisa" %>
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
        <div class="container">
            <header>
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <h1 class="pp-04"><a class="navbar-brand pp-04" href="/mmnfretes/pesquisar">GC Fretes</a></h1>
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
                            <!-- Formulário de pesquisa -->
                            <form class="navbar-form form-group-sm navbar-left">
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="tel" class="form-control mask-cep" id="txCep_origem" placeholder="CEP Origem">
                                </div>
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="tel" class="form-control mask-cep" id="txCep_destino" placeholder="CEP Destino">
                                </div>
                                <button type="button" class="btn btn-primary btn-sm" id="btnBuscarFretes">Buscar</button>
                            </form>
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
                                <%--
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
                                --%>
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
                <section>
                    <div class="alert alert-info fade in">
                        <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                        Saiba mais informações<a href=""> clicando aqui!</a>
                    </div>
                </section>
            </header>
            <aside>
                <!-- Filtro de pesquisa (Desktop) -->
                <div class="col-sm-3 col-md-3 visible-sm visible-md visible-lg">
                    <!-- Filtro de pesquisa: Veículos -->
                    <div class="row">
                        <div class="thumbnail">
                            <div class="veiculos">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                                    <span class="caret"></span>
                                    Veículos 
                                </button>
                                <div class="collapse" id="veiculos">
                                    <filtros-pesquisa:filtro-veiculos-pesados/>
                                    <filtros-pesquisa:filtro-veiculos-medios/>
                                    <filtros-pesquisa:filtro-veiculos-leves/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Filtro de pesquisa: Carrocerias -->
                    <div class="row">
                        <div class="thumbnail">
                            <div class="carrocerias">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                                    <span class="caret"></span>
                                    Carrocerias 
                                </button>
                                <div class="collapse" id="Carrocerias">
                                    <filtros-pesquisa:filtro-carrocerias/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Filtro de pesquisa: Rastreador -->
                    <div class="row">
                        <div class="thumbnail">
                            <div class="rastreador">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                                    <span class="caret"></span>
                                    Rastreador 
                                </button>
                                <div class="collapse" id="Rastreador">
                                    <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                                    <filtros-pesquisa:filtro-rastreador/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Filtro de pesquisa: Formas de Pagamento -->
                    <div class="row">
                        <div class="thumbnail">
                            <div class="formas-pagamento">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                                    <span class="caret"></span>
                                    Formas de Pagamento 
                                </button>
                                <div class="collapse" id="Formas-de-Pagamento">
                                    <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                                    <filtros-pesquisa:filtro-formas-pag/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <main>
                <!-- Conteúdo de pesquisa -->
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
                <my-tags:conteudo-pesquisar/>
            </main>
            <footer>

            </footer>
        </div>

        <!-- Scripts da página 
        ========================================================================================= -->
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <!-- Scripts de mascara para inputs 
        ========================================================================================= -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <!-- Scripts de login 
        ========================================================================================= -->
        <script src="resources/js/login.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws"></script>
        <script src="resources/js/pesquisarfretes.js"></script>
    </body>
</html>
