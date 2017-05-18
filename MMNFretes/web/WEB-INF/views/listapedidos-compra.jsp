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
        <td>${pedido.usuarioVendedor.nome}</td>
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
            <fmt:formatNumber value="${pedido.valor_final + pedido.valor_frete}"
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </td>
        <td>
            <c:if test="${pedido.status eq 1}">
                <button onclick="criarPagamentoPedido(${pedido.id})" class="btn btn-xs col-xs-12 btn-success">Efetuar pagamento</button> 
                <button onclick="setStatusPedido(${pedido.id}, 5)" class="btn btn-xs col-xs-12 btn-warning">Cancelar</button> 
            </c:if>

            <c:if test="${pedido.status eq 3}">
                <button onclick="setStatusPedido(${pedido.id}, 4)" class="btn btn-xs col-xs-12 btn-success">Produto entregue</button> 
            </c:if>
        </td>

    </tr>
</c:forEach>