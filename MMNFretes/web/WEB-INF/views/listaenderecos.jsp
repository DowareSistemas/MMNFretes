<%-- 
    Document   : listaenderecos
    Created on : 03/08/2016, 20:26:01
    Author     : Marcos Vin�cius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="tabela-endereco-item" %>

<c:forEach var="endereco" items="${listaenderecos}">
    <tabela-endereco-item:tabela-endereco id="${endereco.id}" 
                                          bairro="${endereco.bairro}" 
                                          cep="${endereco.cep}" 
                                          logradouro="${endereco.logradouro}" 
                                          municipio="${endereco.cidades.nome}" 
                                          uf="${endereco.estados.sigla}" 
                                          numero="${endereco.numero}"/>
</c:forEach>

