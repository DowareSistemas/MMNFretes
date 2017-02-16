<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="oportunidade" items="${oportunidades}">
    <tr>
        <th>${oportunidade.id}</td>
        <td>${oportunidade.cep_origem}</td>
        <td>${oportunidade.cep_destino}</td>
        <td>${oportunidade.comprimento}</td>
        <td>${oportunidade.altura}</td>
        <td>${oportunidade.largura}</td>
        <td>${oportunidade.volumes}</td>
    </tr>
</c:forEach>