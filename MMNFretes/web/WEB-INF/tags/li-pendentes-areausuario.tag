<%@attribute name="texto" %>
<%@attribute name="id_editar" %>
<li>
    <div class="row">
        <div class="col-sm-12">
            <a class="btn btn-link">${texto}</a>
            <a class="btn btn-link"><span id="${id_editar}" class="glyphicon glyphicon-pencil"></span></a>
        </div>
    </div>
</li>