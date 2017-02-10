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
                    <!-- Resultados dos Lançamentos -->
                    <article>
                        <c:forEach var="oportunidade" items="${oportunidades}">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-primary">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <h3>Nome do Cliente:</h3><br>
                                                    <strong>${oportunidade.usuarios.nome}</strong>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3>Rota:</h3><br>
                                                    <strong>Aproximadamente: ${oportunidade.distancia} Km</strong><br> 

                                                    <label>Origem: </label>
                                                    <label class="h5" id="endereco-origem"> 
                                                        ${oportunidade.cep_origem}
                                                    </label>
                                                    <br/>
                                                    <label>Destino: </label>
                                                    <label class="h5" id="endereco-destino">
                                                        ${oportunidade.cep_destino}
                                                    </label>

                                                </div>
                                                <div class="col-sm-12">
                                                    <h3>Carga:</h3><br>
                                                    <strong>
                                                        Comprimento: ${oportunidade.comprimento}<br>
                                                        Altura: ${oportunidade.altura}<br>
                                                        Largura: ${oportunidade.largura}<br>
                                                        Peso: ${oportunidade.peso}<br>
                                                        Volumes: ${oportunidade.volumes}<br>
                                                        Observações:
                                                    </strong>
                                                    <textarea class="form-control" readonly="true">${oportunidade.observacoes}</textarea>
                                                    <br/>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3>Valor: R$ 00,00</h3><br>
                                                </div>

                                                <div class="col-sm-6">
                                                    <input type="button" class="btn btn-info" value="+ Informações">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="button" class="btn btn-primary pull-right" id="btnAdicionar-oportunidade" onclick="adicionaCotacao(${oportunidade.id})" value="Adicionar">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </article>
                    <!--Fim-->
                </div>
            </main>
            <footer>

            </footer>

            <backend:mensagem-input id="modal-valor-transportador"
                                    id_btnConfirmar="btnConfirmaValor"
                                    id_input="txValor-transportador"
                                    titulo="Valor do frete"
                                    type_input="number"/>
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
        <script src="resources/js/lancamentos.js"></script>

    </body>
</html>
