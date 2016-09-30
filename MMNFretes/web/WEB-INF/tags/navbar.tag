<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>

<!--Navbar fixa no topo-->
<div class="clearfix">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="http://localhost:8080/mmnfretes/pesquisar">Nome Site</a>
                <button type="button" class="navbar-toggle collapsed heighth35" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <button type="button" class="navbar-toggle collapsed heighth35"  data-toggle="collapse" data-target="#collapse-shopping-cart" aria-expanded="false">
                    12 <!-- Quantidade de cotações -->
                    <span class="glyphicon glyphicon-shopping-cart"></span>
                </button>
            </div>
            <!-- Collapse de nav links, forms, e outros conteúdos -->
            <div class="collapse navbar-collapse" id="bs-navbar-collapse">
                <!-- Formulário de pesquisa -->
                <form class="navbar-form navbar-left">
                    <div class="form-group input-group">
                        <span class="btn input-group-addon campo-celular" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="text" class="form-control mask-cep" placeholder="CEP Origem">
                    </div>
                    <div class="form-group input-group">
                        <span class="btn input-group-addon campo-telefone" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="text" class="form-control mask-cep" placeholder="CEP Destino">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Buscar</button>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
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
    </nav>
</div>

<my-tags:conteudo-shoppingcart-navbar/>

<script src="resources/js/mascaras.js"></script>