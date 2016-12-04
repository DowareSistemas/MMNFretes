<%-- 
    Document   : resultadosfretes
    Created on : 02/12/2016, 15:06:41
    Author     : Marcos Vinícius
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes"%>


<!-- Conteúdo de pesquisa -->
<c:forEach var="resultado" items="${resultados}">
    <pesquisarfretes:conteudo-pesquisar
        carroceria="${resultado.veiculo.carrocerias.descricao}"
        categoria="${resultado.veiculo.categorias_veiculos.descricao}"
        preco="${resultado.preco_frete}"
        transportadora="${resultado.veiculo.transportadoras.nome}"
        veiculo="${resultado.veiculo.descricao}"
        foto="${resultado.foto_path}"
        />           
</c:forEach>