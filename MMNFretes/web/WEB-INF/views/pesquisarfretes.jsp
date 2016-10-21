<%-- 
    Document   : pesquisarfretes
    Created on : 15/08/2016, 21:41:01
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisar/" prefix="pesquisar" %>
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
                <my-tags:navbar/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <!-- Form de pesquisa -->
                        <div class="col-md-12">
                            <form class="form-group panel-pesquisa">
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="tel" class="form-control mask-cep" id="txCep_origem" placeholder="CEP Origem">
                                </div>
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="tel" class="form-control mask-cep" id="txCep_destino" placeholder="CEP Destino">
                                </div>
                                <button type="button" class="btn btn-primary btn-block" id="btnBuscarFretes">Buscar</button>
                            </form>
                        </div>
                        <div class="col-md-12">
                            <div class="panel-pesquisa">
                                <h4 class="text-muted text-uppercase text-center">Filtros de pesquisa</h4>
                                <!-- Filtro de pesquisa: Veículos -->
                                <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                                    Veículos 
                                </button><br>
                                <div class="collapse" id="veiculos">
                                    <div class="thumbnail">
                                        <pesquisar:filtro-veiculos-pesados/>
                                        <pesquisar:filtro-veiculos-medios/>
                                        <pesquisar:filtro-veiculos-leves/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Carrocerias -->
                                <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                                    Carrocerias 
                                </button><br>
                                <div class="collapse" id="Carrocerias">
                                    <div class="thumbnail">
                                        <pesquisar:filtro-carrocerias/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Rastreador -->
                                <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                                    Rastreador 
                                </button><br>
                                <div class="collapse" id="Rastreador">
                                    <div class="thumbnail">
                                        <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                                        <pesquisar:filtro-rastreador/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Formas de Pagamento -->
                                <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                                    Formas de Pagamento 
                                </button><br>
                                <div class="collapse" id="Formas-de-Pagamento">
                                    <div class="thumbnail">
                                        <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                                        <pesquisar:filtro-formas-pag/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <main>
                <div class="aside-fixed-main">
                    <section>
                        <div class="alert alert-info fade in">
                            <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                            Saiba mais informações<a href=""> clicando aqui!</a>
                        </div>
                    </section>
                    <!-- Conteúdo de pesquisa -->
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    <pesquisar:conteudo-pesquisar/>
                    
                </div>
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
