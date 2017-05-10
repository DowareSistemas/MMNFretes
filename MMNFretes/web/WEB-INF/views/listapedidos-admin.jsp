<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="pedido" items="${pedidos}">
    <tr>
        <th>${pedido.id}</th>
        <th>
            <fmt:formatDate value="${pedido.data}" pattern="dd/MM/yyyy"/>
        </th>
        <th>${pedido.usuarioVendedor.nome}</th>
        <th>${pedido.usuarios.nome}</th>
        <th>${pedido.produtos.nome}</th>
        <th>
            <fmt:formatNumber value="${pedido.valor_unit}" 
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </th>
        <th>${pedido.quant}</th>
        <th>
            <fmt:formatNumber value="${pedido.valor_final}" 
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </th>
        <th>
            <fmt:formatNumber value="${pedido.valor_final - pedido.valor_final / 100 * 10}"
                              minFractionDigits="2"
                              maxFractionDigits="2"
                              type="currency"/>
        </th>
        <th>
            <c:if test="${pedido.status_repasse eq 0}">
                <button onclick="efetuarRepasseRepresentante(${pedido.id})" class="btn btn-xs col-xs-12 btn-success">Repasse</button>    
            </c:if>

            <c:if test="${pedido.status_repasse eq 1}">
                <button class="btn btn-xs col-xs-12 btn-default disabled">Repassado</button>    
            </c:if>
        </th>
    </tr>
</c:forEach>