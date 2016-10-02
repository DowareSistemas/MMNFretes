<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="id" %>
<%@attribute name="descricao" %>
<%@attribute name="capacidade" %>
<%@attribute name="categoria" %>
<%@attribute name="carroceria" %>
<%@attribute name="rastreador" %>

<tr>
    <td>${descricao} </td>
    <td>${capacidade}</td>
    <td>${categoria}</td>
    <td>${carroceria}</td>

    <c:if test="${rastreador eq true}">
        <td>SIM</td>     
    </c:if>

    <c:if test="${rastreador eq false}">
        <td>NÃO</td>     
    </c:if>

    <td>
        <button type="button" class="btn btn-info btn-xs center-block" id="${id}">Editar</button>
    </td>
</tr>