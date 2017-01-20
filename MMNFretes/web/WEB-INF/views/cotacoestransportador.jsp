<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>
            <a type="button" onclick="mostraDetalhesItem(${cotacao.id})" class="btn btn-info btn-xs center-block"> + Info </a>
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

        <c:if test="${cotacao.status eq 4}">
            <td> Aguardando pagamento </td>
        </c:if>

        <c:if test="${cotacao.status eq 5}">
            <td> Aguardando entrega </td>
        </c:if>

        <td>${cotacao.usuarios.nome}</td>
        <td><fmt:formatDate type="date" value ="${cotacao.data}" /></td>
        <td>${cotacao.veiculos.descricao}</td>
        <td>${cotacao.distancia} Km </td>
        <td>
            <fmt:formatNumber type="currency" maxFractionDigits="3" value="${cotacao.valor}"/>
        </td>

        <td>
            <c:if test="${cotacao.status eq 1}">
                <a type="button" class="btn btn-primary btn-sm btn-xs" onclick="aprovaItemCotacao(${cotacao.id})"> Aprovar </a>
                <a type="button" class="btn btn-danger btn-sm btn-xs" onclick="reprovaItemCotacao(${cotacao.id})"> Recusar </a>
            </c:if>
        </td>
    </tr>
</c:forEach>