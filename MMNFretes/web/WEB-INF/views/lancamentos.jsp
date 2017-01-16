<%-- 
    Document   : lancamentos
    Created on : 12/01/2017, 21:51:43
    Author     : emers
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <link href="resources/css/criarconta-entrar.css" rel="stylesheet" media="screen">
        <title>Lançamentos - GC Fretes</title>
    </head>
    <body>      
        <div class="container-fluid">
            <header>
                <my-tags:navbar redireciona_perfil="false"/>
                <pesquisarfretes:criarconta-entrar/>
                <pesquisarfretes:pesquisar-mapa/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel-aside">
                                <h4 class="text-muted text-uppercase text-center">Filtros de pesquisa</h4>
                                <!-- Filtro de pesquisa: Veículos -->
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                                    Veículos 
                                </button><br>
                                <div class="collapse" id="veiculos">
                                    <div class="thumbnail">
                                        <pesquisarfretes:filtro-veiculos-pesados/>
                                        <pesquisarfretes:filtro-veiculos-medios/>
                                        <pesquisarfretes:filtro-veiculos-leves/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Carrocerias -->
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                                    Carrocerias 
                                </button><br>
                                <div class="collapse" id="Carrocerias">
                                    <div class="thumbnail">
                                        <pesquisarfretes:filtro-carrocerias/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Rastreador -->
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                                    Rastreador 
                                </button><br>
                                <div class="collapse" id="Rastreador">
                                    <div class="thumbnail">
                                        <h5 class="text-muted text-uppercase text-center">Veículos com rastreador</h5>
                                        <pesquisarfretes:filtro-rastreador/>
                                    </div>
                                </div>
                                <!-- Filtro de pesquisa: Formas de Pagamento -->
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                                    Formas de Pagamento 
                                </button><br>
                                <div class="collapse" id="Formas-de-Pagamento">
                                    <div class="thumbnail">
                                        <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                                        <pesquisarfretes:filtro-formas-pag/>
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
                        <div class="row">
                            <div class="col-sm-12 ">
                                <div class="alert alert-info fade in">
                                    <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                                    Saiba mais informações<a href=""> clicando aqui!</a>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%-- Resultados dos Lançamentos --%>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 ">
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h3>Nome do Cliente:</h3><br>
                                                João das Coves
                                            </div>
                                            <div class="col-sm-12">
                                                <h3>Rota:</h3><br>
                                                Aproximadamente: 00,00 Km<br> 
                                                Endereço de origem: CEP, Bairro / Distrito, Logradouro / Nome, Número, Complemento, Município, UF.<br>
                                                Endereço de destino: CEP, Bairro / Distrito, Logradouro / Nome, Número, Complemento, Município, UF.<br>
                                            </div>
                                            <div class="col-sm-12">
                                                <h3>Carga:</h3><br>
                                                Dimensões:<br>
                                                Comprimento:<br>
                                                Altura:<br>
                                                Largura:<br>
                                                Peso:<br>
                                                Quantidade de volumes:<br>
                                                Descrição:<br>
                                            </div>
                                            <div class="col-sm-12">
                                                <h3>Veículo:</h3><br>
                                                Tipo de veículo:<br>
                                                Carroceria:<br>
                                                Rastreador:<br>
                                                Forma de Pagamento:<br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
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
        <script src="resources/js/pesquisarfretes.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
        <script src="resources/js/maps.js"></script>

    </body>
</html>
