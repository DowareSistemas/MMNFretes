<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="pedido" items="${pedidos}">
    <tr>
        <td>${pedido.id}</td>
        <td>
            <c:if test="${pedido.status eq 0}">
                AGUARDANDO FRETE
            </c:if>

            <c:if test="${pedido.status eq 1}">
                AGUARDANDO PAGAMENTO
            </c:if>

            <c:if test="${pedido.status eq 2}">
                AGUARDANDO COLETA
            </c:if>

            <c:if test="${pedido.status eq 3}">
                AGUARDANDO ENTREGA
            </c:if>

            <c:if test="${pedido.status eq 4}">
                FINALIZADO
            </c:if>

            <c:if test="${pedido.status eq 5}">
                CANCELADO
            </c:if>
        </td>
        <td>${pedido.usuarios.nome}</td>
        <td>${pedido.data}</td>
        <td>${pedido.produtos.nome}</td>
        <td>
            <fmt:formatNumber value="${pedido.produtos.preco}"
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </td>
        <td>${pedido.quant}</td>
        <td>
            <fmt:formatNumber value="${pedido.valor_frete}"
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </td>
        <td>
            <fmt:formatNumber value="${pedido.valor_final}"
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </td>

        <c:if test="${pedido.status eq 2}">
            <td>
                <button onclick="setStatusPedido(${pedido.id}, 3)" class="btn btn-xs btn-success">Coletado</button> 
            </td>
        </c:if>
    </tr>
</c:forEach>