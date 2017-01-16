<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<c:forEach var="cotacao" items="${cotacoes}">
    <tr>
        <td>${cotacao.id}</td>
        <td>${cotacao.usuarios.nome}</td>
        <td>${cotacao.transportadoras.nome}</td>
        <td>
            <fmt:formatDate type="date" value="${cotacao.data}"/>
        </td>
        
        <c:if test="${cotacao.status eq 4}">
            <td> Aguardando pagamento </td>
        </c:if>

        <c:if test="${cotacao.status eq 5}">
            <td> Aguardando entrega </td>
        </c:if>

        <td> ${cotacao.token_envio} </td>
        <td> ${cotacao.token_resposta} </td>
        <td>
            <fmt:formatNumber minFractionDigits="2" value="${cotacao.valor}"  />  
        </td>

        <td>
            <button type="button" class="btn btn-info btn-xs center-block">+ Informações</button>
        </td>
    </tr>
</c:forEach>