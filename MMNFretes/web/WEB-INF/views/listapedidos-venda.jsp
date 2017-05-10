<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <td>${pedido.valor_final}</td>

        <c:if test="${pedido.status eq 2}">
            <td>
                <button onclick="setStatusPedido(${pedido.id}, 3)" class="btn btn-xs btn-success">Coletado</button> 
            </td>
        </c:if>
    </tr>
</c:forEach>