<%-- 
    Document   : pesquisarfretes
    Created on : 15/08/2016, 21:41:01
    Author     : emers
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <link href="resources/css/criarconta-entrar.css" rel="stylesheet" media="screen">
        <title>GC Fretes - Gestão Compartilhada de Fretes</title>
    </head>
    <body>      
        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
                <pesquisarfretes:criarconta-entrar/>
                <pesquisarfretes:pesquisar-mapa/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Form de pesquisa -->
                            <form class="form-group panel-aside">
                                <h4 class="text-muted text-uppercase text-center">Calcular trajeto</h4>
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" id="btnPesquisaCepOrigem" title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="text" class="form-control mask-cep" id="txCep_origem" placeholder="CEP Origem" value="">
                                </div>
                                <div class="form-group input-group">
                                    <span class="btn input-group-addon" id="btnPesquisaCepDestino"  title="Pesquisar CEP"><i class="glyphicon glyphicon-search"></i></span>
                                    <input type="text" class="form-control mask-cep" id="txCep_destino" placeholder="CEP Destino" value="">
                                </div>
                                <button type="button" class="btn btn-primary btn-block" id="btnBuscarFretes">Buscar</button>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-aside">
                                <h4 class="text-muted text-uppercase text-center">Filtros de pesquisa</h4>
                                <!-- Filtro de pesquisa: Veículos -->
                                <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                                    Categorias 
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
                            <div class="col-md-12 ">
                                <div class="alert alert-info fade in">
                                    <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    Você poderá negociar valores após finalizar as cotações em sua página, no painel de <strong class="text-uppercase">pendentes</strong>.
                                    Saiba mais informações<a href=""> clicando aqui!</a>
                                </div>
                            </div>
                        </div>
                    </section>

                    <div id="resultados-pesquisa">

                    </div>
                </div>
            </main>
            <footer>

            </footer>
        </div>
                                    
        <backend:mensagem-ok id_btnOK="btnOK" id="senhaIncorreta" mensagem="Usuário ou senha incorretos!" />
        <backend:mensagem-ok id="msgSUCAT" id_btnOK="btnSUCAT" mensagem="Selecione ao menos uma categoria de veículo!"/>
        <backend:mensagem-ok id="msgSUCARR" id_btnOK="btnSUCARR" mensagem="Selecione ao menos uma carroceria de veículo!"/>
        <!-- Scripts da página 
        ========================================================================================= -->
        <script src="resources/js/ambientes.js"></script>
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
        <script src="resources/js/navbar.js"></script>
        <script src="resources/js/mensagens.js"></script>

        <script>
            setRedirecionaPerfil(false);
        </script>
    </body>
</html>