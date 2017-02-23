<%-- 
    Document   : lancamentos
    Created on : 12/01/2017, 21:51:43
    Author     : emers
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/lancamentos/" prefix="lancamentos"%>
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
        <title>Oportunidades - GC Fretes</title>
    </head>
    <body>      


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
        <script src="resources/js/lancamentos.js"></script>
        <script src="resources/js/navbar.js"></script>

        <div class="container-fluid">
            <header>
                <my-tags:navbar redireciona_perfil="false"/>
            </header>

            <main>
                <c:if test="${fn:length(resultados) eq 0}">
                    <h3>No momento, não encontramos nenhuma oportunidade compatível com seu perfil de transportador.</h3>
                    <h3>Tente novamento mais tarde.</h3>
                </c:if>
                <div class="row">
                    <%--Resultados dos Lançamentos--%>
                    <c:forEach var="resultado" items="${resultados}">
                        <article>
                            <div class="col-xs-12 col-md-6" id="resultado-lancamento${resultado.oportunidades.id}">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <div class="row">
                                            <div class="col-xs-6">
                                                <h5><strong>${resultado.oportunidades.usuarios.nome}</strong></h5>
                                            </div>
                                            <div class="col-xs-12">
                                                <p>Distância: <strong class="pull-right">${resultado.oportunidades.distancia}Km</strong></p>
                                            </div>
                                            <div class="col-xs-12" onafterprint="teste()">
                                                <p>Origem: <strong id="op${resultado.oportunidades.id}_cep_origem" class="pull-right">${resultado.oportunidades.cep_origem}</strong></p>
                                            </div>
                                            <div class="col-xs-12">
                                                <p>Destino: <strong id="op${resultado.oportunidades.id}_cep_destino" class="pull-right">${resultado.oportunidades.cep_destino}</strong></p>
                                            </div>

                                            <script>
                                                carregaEnderecoByCEP("${resultado.oportunidades.cep_origem}", $("#" + "op${resultado.oportunidades.id}_cep_origem"));
                                                carregaEnderecoByCEP("${resultado.oportunidades.cep_destino}", $("#" + "op${resultado.oportunidades.id}_cep_destino"));
                                            </script>

                                            <div class="col-xs-12">
                                                <p>Dimensões: <strong class="pull-right">${resultado.oportunidades.altura} x ${resultado.oportunidades.largura} x ${resultado.oportunidades.comprimento} metros</strong></p>
                                            </div>
                                            <div class="col-xs-6">
                                                <p>Peso: <strong class="pull-right">${resultado.oportunidades.peso}</strong></p>
                                            </div>
                                            <div class="col-xs-6">
                                                <p>Volume(s): <strong class="pull-right">${resultado.oportunidades.volumes}</strong></p>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-6">
                                                    <select class="form-control" id="cbOp${resultado.oportunidades.id}">
                                                        <option value="0">Selecione um veículo</option>
                                                        <c:forEach var="veiculo" items="${resultado.veiculos}">
                                                            <option value="${veiculo.id}">${veiculo.descricao}</option>
                                                        </c:forEach>
                                                    </select>   
                                                </div>
                                                <div class="col-xs-6">
                                                    <h4 class="text-primary text-center" id="op${resultado.oportunidades.id}_preco" style="margin-top: 10px;"><strong>R$ 0,00</strong></h4>
                                                </div>

                                                <script>
                                                    $("#cbOp${resultado.oportunidades.id}").change(function ()
                                                    {
                                                        var veiculo_id = $("#cbOp${resultado.oportunidades.id}").val();

                                                        if (veiculo_id == '0')
                                                        {
                                                            $("#op${resultado.oportunidades.id}_preco").text("R$ 0,00");
                                                            return;
                                                        }

                                                        var url = "/gcfretes/precoveiculo";
                                                        var parametros =
                                                                {
                                                                    veiculo_id: veiculo_id,
                                                                    distancia: ${resultado.oportunidades.distancia}
                                                                };

                                                        $.post(url, parametros, function (preco)
                                                        {
                                                            $("#op${resultado.oportunidades.id}_preco").text("R$ " + preco);
                                                        });
                                                    });
                                                </script>
                                            </div>
                                            <div class="col-xs-6">
                                                <button class="col-xs-12 btn btn-info" data-toggle="collapse" data-target="#mais-informacoes${resultado.oportunidades.id}">Mais Informações</button>
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="button" class="col-xs-12 btn btn-primary" id="btAdicionar${resultado.oportunidades.id}" value="Adicionar">

                                                <script>
                                                    $("#btAdicionar${resultado.oportunidades.id}").click(function ()
                                                    {
                                                        var veiculo_id = $("#cbOp${resultado.oportunidades.id}").val();
                                                        if (veiculo_id == '0')
                                                            return;

                                                        var cotacao =
                                                                {
                                                                    valor: parseFloat($("#op${resultado.oportunidades.id}_preco").text().replace("R$ ", "")),
                                                                    cep_origem: "${resultado.oportunidades.cep_origem}",
                                                                    cep_destino: "${resultado.oportunidades.cep_destino}",
                                                                    distancia: parseFloat("${resultado.oportunidades.distancia}"),
                                                                    usuarios_id: ${resultado.oportunidades.usuarios.id},
                                                                    veiculos_id: veiculo_id,
                                                                    oportunidade_id: ${resultado.oportunidades.id}
                                                                };

                                                        aceitarOportunidade(cotacao, "#resultado-lancamento${resultado.oportunidades.id}");
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div id="mais-informacoes${resultado.oportunidades.id}" class="collapse">
                                            <div class="row">
                                                <div class="col-xs-8">
                                                    <h4><strong>${resultado.oportunidades.usuarios.nome}</strong></h4>
                                                </div>
                                                <div class="col-xs-4">
                                                    <h4 class="text-right">Distância: <strong>${resultado.oportunidades.distancia}Km</strong></h4>
                                                </div>
                                                <div class="col-xs-12">
                                                    <h4>Descrição:</h4>
                                                </div>
                                                <div class="col-xs-12">
                                                    <p class="text-justify"><!--Desrição do lançamento-->
                                                        ${resultado.oportunidades.observacoes}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
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
    </body>
</html>
