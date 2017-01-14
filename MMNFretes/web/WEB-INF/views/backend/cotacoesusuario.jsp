<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>
            <a onclick="mostraDetalhesItem(${cotacao.id})" type="button" class="btn btn-info btn-xs center-block" data-toggle="modal" data-target="#detalhes_cotacao_usuario">+ Info</a>
        </td>

        <c:if test="${cotacao.status eq 0}">
            <td> Selecionando </td>
        </c:if>

        <c:if test="${cotacao.status eq 1}">
            <td> Aguardando aprova��o </td>
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
            <td>  Aguardando entrega </td>
        </c:if>

        <td>${cotacao.transportadoras.nome}</td>

        <td>
            <fmt:formatDate type="date" value="${cotacao.data}"/>
        </td>

        <td>${cotacao.veiculos.descricao}</td>
        <td>${cotacao.distancia} Km </td>
        <td>
            <fmt:formatNumber type="currency" maxFractionDigits="3" value="${cotacao.valor}"/>
        </td>

        <td>
            <a type="button" onclick="cancelaItemCotacao(${cotacao.id})" class="btn btn-danger btn-xs center-block">Cancelar</a>
        </td>
    </tr>
</c:forEach>