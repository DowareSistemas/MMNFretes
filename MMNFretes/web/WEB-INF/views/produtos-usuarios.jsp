<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="produto" items="${resultados}">
    <tr>
        <td>${produto.id}</td>
        <th>${produto.nome}</th>
        <th>
            <fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${produto.preco}"/>
        </th>

        <th>${produto.unidade}</th>
        <th>
            <button class="btn btn-xs btn-sm center-block btn-info" onclick="carregaProduto(${produto.id})">Alterar</button>
        </th>
    </tr>
</c:forEach>