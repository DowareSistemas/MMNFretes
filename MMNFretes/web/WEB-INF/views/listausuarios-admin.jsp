<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="usuario" items="${usuarios}">
    <tr>
        <td>${usuario.usuario.id}</td>
        <td>${usuario.usuario.nome}</td>
        <td>${usuario.usuario.email}</td>
        <td>
            <c:if test="${usuario.usuario.tipo_usuario eq 1}">
                ${usuario.transportadora.ANTT}
            </c:if>
        </td>
        <td>
            <c:if test="${usuario.usuario.tipo_usuario eq 1}">
                ${usuario.transportadora.CPF_CNPJ}
            </c:if>
        </td>
        <td>Plano</td>
        <td>Ativo</td>
        <td>
            <fmt:formatNumber value="${usuario.debito}"
                              type="currency"
                              minFractionDigits="2"
                              maxFractionDigits="2"/>
        </td>
        <td>Ações</td>
    </tr>
</c:forEach>