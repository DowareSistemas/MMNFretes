<%-- 
    Document   : tabela-endereco
    Created on : 03/08/2016, 18:45:14
    Author     : Marcos Vinícius
--%>

<%@attribute name="id" %>
<%@attribute name="cep" %>
<%@attribute name="uf" %>
<%@attribute name="municipio" %>
<%@attribute name="bairro" %>
<%@attribute name="logradouro" %>
<%@attribute name="numero" %>

<tr>
    <td>${cep}</td>
    <td>${uf}</td>
    <td>${municipio}</td>
    <td>${bairro}</td>
    <td>${logradouro}</td>
    <td>${numero}</td>
    <td>
        <button type="button" class="btn btn-info btn-xs btnEditar" value="0" onclick="carregaEnderecoEdicao(${id})" >Editar</button>
    </td>
</tr>
