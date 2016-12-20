<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>
            <button type="button" class="btn btn-info btn-xs center-block">+ Inf.</button>
        </td>

        <c:if test="${cotacao.status eq 0}">
            <td> Selecionando </td>
        </c:if>

        <c:if test="${cotacao.status eq 1}">
            <td> Aguardando aprovação </td>
        </c:if>        

        <c:if test="${cotacao.status eq 2}">
            <td> Aprovado </td>
        </c:if>

        <c:if test="${cotacao.status eq 3}">
            <td> Recusado </td>
        </c:if>

        <td>${cotacao.usuarios.nome}</td>
        <td><fmt:formatDate type="date" value ="${cotacao.data}" /></td>
        <td>${cotacao.veiculos.descricao}</td>
        <td>Cartão</td>
        <td>
            <fmt:formatNumber type="currency" maxFractionDigits="3" value="${cotacao.valor}"/>
        </td>

        <td>
            <button type="button" class="btn btn-primary btn-xs col-sm-8">Ação</button>
        </td>
    </tr>
</c:forEach>