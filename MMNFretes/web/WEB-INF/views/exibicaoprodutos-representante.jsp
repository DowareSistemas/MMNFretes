<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="resultado" items="${resultados}">
    <!-- PRODUTO 1 -->
    <div class="visible-xs visible-sm visible-md visible-lg" id="produto-1">
        <div class="col-sm-3 col-lg-2 form-group">
            <div class="row">
                <div class="col-xs-5 col-sm-12">

                    <c:if test="${resultado.foto_path eq 'not_localized'}">
                        <img src="resources/img/logo.png" alt="Imagem Produto" class="img-rounded" width="150" height="100">
                    </c:if>

                    <c:if test="${resultado.foto_path ne 'not_localized'}">
                        <img class="img-thumbnail" src="${resultado.foto_path}" alt="Imagem Repreentação" width="150" height="100">
                    </c:if>

                </div>
                <div class="col-xs-7 col-sm-12">
                    <h4>${resultado.produto.nome}</h4>
                    <h4 class="text-muted">
                        <fmt:formatNumber value="${resultado.produto.preco}"
                                          minFractionDigits="2"
                                          maxFractionDigits="2"
                                          type="currency"/>
                    </h4>
                    <p>Quantidade: 
                        <fmt:formatNumber value="${resultado.produto.quant}"
                                          minFractionDigits="2"
                                          maxFractionDigits="2"/>  ${resultado.produto.unidade}</p>
                    <div class="row">
                        <div class="col-xs-12">
                            <button onclick="criaPedidoVenda(${resultado.produto.id})" class="btn btn-success btn-block">Comprar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>