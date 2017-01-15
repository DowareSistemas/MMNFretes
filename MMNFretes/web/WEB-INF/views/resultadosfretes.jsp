<%-- 
    Document   : resultadosfretes
    Created on : 02/12/2016, 15:06:41
    Author     : Marcos Vinícius
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>


<!-- Conteúdo de pesquisa -->
<c:forEach var="resultado" items="${resultados}">

    <article id="resultado${resultado.veiculo.id}">
        <div class="row">
            <div class="col-md-12 ">
                <div class="thumbnail">
                    <div class="row">
                        <div class="col-sm-3 col-md-2 visible-sm visible-md visible-lg">
                            <div class="ratings">
                                <c:if test="${resultado.foto_path eq 'not_localized'}">
                                    <img src="resources/img/checked_truck-512.png" class="img-thumbnail img-responsive" alt="Cinque Terre">    
                                </c:if>

                                <c:if test="${resultado.foto_path ne 'not_localized'}">
                                    <img src="${resultado.foto_path}" class="img-thumbnail img-responsive" alt="Cinque Terre">
                                </c:if>
                            </div>
                        </div> 
                        <div class="col-xs-8 col-sm-5">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <h3 class="text-primary">${resultado.veiculo.descricao}</h3>
                            </div>

                            <div class="col-sm-12 col-md-12">
                                <h4 class="text-primary">${resultado.veiculo.transportadoras.nome}</h4>
                            </div>

                            <div class="col-md-10">
                                <h5 class="text-primary">${resultado.veiculo.transportadoras.usuarios.telefone1}</h5>
                                <h5 class="text-primary">${resultado.veiculo.transportadoras.usuarios.telefone2}</h5>
                                <h5 class="text-primary">${resultado.veiculo.transportadoras.usuarios.email}</h5>
                            </div>

                            <div class="col-xs-12 col-sm-12 colmd-12">
                                <p>
                                    <c:forEach var="positivas" items="${resultado.av_positivas}">
                                        <span class="glyphicon glyphicon-star"></span>
                                    </c:forEach>

                                    <c:forEach var="negativa" items="${resultado.av_negativas}">
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                    </c:forEach>
                                </p>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-5">
                            <div class="pull-right panel-default">
                                <h4 class="center-block" id="lbValorFrete"><fmt:formatNumber type="currency" 
                                                  maxFractionDigits="2" 
                                                  value="${resultado.preco_frete}" /></h4>

                                <button type="button" onclick="adicionarVeiculoCotacao(${resultado.veiculo.transportadoras.id}, ${resultado.veiculo.id}, ${resultado.preco_frete})" class="btn center-block btn-primary">Adicionar</button>
                            </div>
                        </div>
                    </div>
                    <div class="visible-sm visible-md visible-lg"><hr>
                        <div class="row">
                            <div class="col-sm-3 col-md-3">
                                <label for="sel1">Categoria: </label>
                                <p>${resultado.veiculo.categorias_veiculos.descricao}</p>
                            </div>
                            <div class="col-sm-3 col-md-3">
                                <label for="sel1">Carroceria: </label>
                                <p>${resultado.veiculo.carrocerias.descricao}</p>
                            </div>
                            <div class="col-sm-3 col-md-3">
                                <label for="sel1">Rastreador: </label>
                                <c:if test="${resultado.veiculo.rastreador eq true}">
                                    <p> Sim <p/>
                                </c:if>

                                <c:if test="${resultado.veiculo.rastreador eq false}">
                                    <p> Não </p>
                                </c:if>
                            </div>
                            <div class="col-sm-3 col-md-3">
                                <label for="sel1">Forma de Pagamento: </label>
                                <p>Cartão</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>

</c:forEach>