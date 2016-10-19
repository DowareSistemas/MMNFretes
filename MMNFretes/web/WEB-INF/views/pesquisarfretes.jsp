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
                <!-- Barra de navegação -->
                <my-tags:navbar/>
                <!-- Conteudo da página -->
                <div class="alert alert-info fade in">
                    <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                    Saiba mais informações<a href=""> clicando aqui!</a>
                </div>     
            </header>
            <main>
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
                <section>
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
                </section>
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
