<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="historico" items="${list_historico}">
    <tr>
        <td>${historico.id}</td>
        <td>
            <fmt:formatDate type="date" value="${historico.data}"/>
        </td>

        <td>${historico.transportadoras.nome}</td>
        <td>${historico.veiculos.descricao}</td>
        <td>${historico.distancia} Km</td>
        <td>
            <fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${historico.valor}"/>
        </td>
    <tr>
    </c:forEach>