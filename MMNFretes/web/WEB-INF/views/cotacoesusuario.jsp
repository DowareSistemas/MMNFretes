<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>
            <button onclick="mostraDetalhesItem(${cotacao.id})" type="button" class="btn btn-info btn-xs center-block" data-toggle="modal" data-target="#detalhes_cotacao_usuario">+ Inf.</button>
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
            
        <td>${cotacao.transportadoras.nome}</td>

        <td>
            <fmt:formatDate type="date" value="${cotacao.data}"/>
        </td>

        <td>${cotacao.veiculos.descricao}</td>
        <td>*FALTA VER*</td>
        <td>
            <fmt:formatNumber type="currency" maxFractionDigits="3" value="${cotacao.valor}"/>
        </td>

        <td>
            <button type="button" onclick="cancelaItemCotacao(${cotacao.id})" class="btn btn-danger btn-sm">Cancelar</button>
        </td>
    </tr>
</c:forEach>