<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="cotacao" items="${cotacoes}">

    <tr id="cotacao${cotacao.id}">
        <td>
            <div class="row">
                <div class="col-xs-12">
                    <h5 class="text-primary">${cotacao.transportadoras.nome}</h5>
                </div>
                <div class="col-xs-12">
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div> 
            </div>
        </td>
        <td>
            <div  class="row">
                <div class="col-xs-12">
                    <h5>${cotacao.veiculos.descricao}</h5>
                </div>
            </div>
        </td>
        <td>
            <div class="row">
                <div class="col-xs-12">
                    <h5><fmt:formatNumber type="currency" 
                                      maxFractionDigits="3" 
                                      value="${cotacao.valor}"/> </h5>
                </div>
            </div>
        </td>
        <td>
            <div class="row">
                <div class="col-xs-12">
                    <button type="button" onclick="removeVeiculoCotacao(${cotacao.id})" class="btn btn-danger pull-right">Remover</button>
                </div>
            </div>
        </td>
    </tr>
</c:forEach>