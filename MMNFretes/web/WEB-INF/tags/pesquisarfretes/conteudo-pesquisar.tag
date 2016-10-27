<%@attribute name="veiculo" required="true"%>
<%@attribute name="preco" required="true" %>
<%@attribute name="categoria" required="true" %>
<%@attribute name="carroceria" required="true" %>
<%@attribute name="transportadora" required="true" %>

<article>
    <div class="row">
        <div class="col-md-12 ">
            <div class="thumbnail">
                <div class="row">
                    <div class="col-sm-3 col-md-2 visible-sm visible-md visible-lg">
                        <div class="ratings">
                            <img src="resources/img/checked_truck-512.png" class="img-thumbnail img-responsive" alt="Cinque Terre">
                        </div>
                    </div> 
                    <div class="col-xs-8 col-sm-5">
                        <div class="col-xs-12 col-sm-12 colmd-12">
                            <h4 class="text-primary">${veiculo}</h4>
                        </div>
                        <div class="col-xs-12 col-sm-12 colmd-12">
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-5">
                        <div class="pull-right panel-default">
                            <h4 class="center-block">R$ ${preco}</h4>
                            <button type="button" class="btn center-block btn-primary">Adicionar</button>
                        </div>
                    </div>
                </div>
                <div class="visible-sm visible-md visible-lg"><hr>
                    <div class="row">
                        <div class="col-sm-3 col-md-3">
                            <label for="sel1">Caregoria: </label>
                            <p>${categoria}</p>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <label for="sel1">Carroceria: </label>
                            <p>${carroceria}</p>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <label for="sel1">Rastreador: </label>
                            <p>Não</p>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <label for="sel1">Forma de Pagamento: </label>
                            <p>Cartão</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>