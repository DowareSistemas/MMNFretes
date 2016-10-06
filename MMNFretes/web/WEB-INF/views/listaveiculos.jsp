<%-- 
    Document   : listaveiculos
    Created on : 01/10/2016, 14:26:26
    Author     : Marcos Vinícius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags" %>

<c:forEach var="veiculo" items="${veiculos}">
    <my-tags:tabela_veiculos
        id         = "${veiculo.id}"
        descricao  = "${veiculo.descricao}"
        capacidade = "${veiculo.capacidade} ${veiculo.tipos_carga.descricao}"
        carroceria = "${veiculo.categorias_veiculos.descricao}"
        categoria  = "${veiculo.carrocerias.descricao}"
        rastreador = "${veiculo.rastreador}" />
</c:forEach>
