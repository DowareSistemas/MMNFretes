<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="produto" items="${produtos}">
<!-- PRODUTO -->
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 form-group">
    <div class="panel panel-primary">
        <div class="panel-body row">
            <div class="col-xs-12 form-group">
                <button class="btn btn-info btn-xs pull-right" data-toggle="modal" data-target="#${produto.id}">
                    <i class="glyphicon glyphicon-info-sign"></i>
                </button>
                <img src="resources/img/logo.png" alt="Imagem Produto" class="img-rounded center-block" height="200">
            </div>
            <div class="col-xs-12">
                <h2>${nome}</h2>
            </div>
            <div class="col-xs-12">
                <h2>
                    <small>
                        <fmt:formatNumber value="${produto.preco}"
                                          minFractionDigits="2"
                                          maxFractionDigits="2"
                                          type="currency"/>
                    </small>
                </h2>
            </div>
            <div class="col-xs-12">
                <h3><small>Quantidade: ${produto.quant} <span>${produto.unidade}</span></small></h3>
            </div>
            <div class="col-xs-12">
                <button class="btn btn-success center-block">Comprar</button>
            </div>
        </div>
    </div>

    <!-- MODAL DE DESCRIÇÃO -->
    <div class="modal fade" id="${produto.id}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">${produto.nome}</h4>
                </div>
                <div class="modal-body">
                    ${produto.descricao}
                </div>
            </div>
        </div>
    </div>
</div><!-- PRODUTO -->
</c:forEach>