<%-- 
    Document   : resultado
    Created on : 03/08/2016, 18:45:14
    Author     : Marcos Vinícius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="endereco" items="${lista}">
    <tr>
        <td>${endereco.id}</td>
        <td>${endereco.logradouro}</td>
        <td>${endereco.CEP}</td>
    </tr>
</c:forEach>