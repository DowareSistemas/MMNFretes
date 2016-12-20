<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>
            <button type="button" class="btn btn-info btn-xs center-block" data-toggle="modal" data-target="#detalhes_cotacao_usuario">+ Inf.</button>
        </td>
        
        <td>${cotacao.status}</td>
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
            <button type="button" class="btn btn-danger btn-xs col-sm-8">Cancelar</button>
        </td>
    </tr>
</c:forEach>