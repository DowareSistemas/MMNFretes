<%@attribute name="mensagem" %>
<%@attribute name="id" %>
<%@attribute name="id_btnOK" %>

<div class="modal fade bd-example-modal-sm" id="${id}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Mensagem</h4>
            </div>
            <div class="modal-body">
                <p class="text-center"> ${mensagem} </p>
            </div>
            <div class="modal-footer">
                <button type="button" id="${id_btnOK}" class="btn btn-primary" data-dismiss="modal"> OK </button>
            </div>
        </div>
    </div>
</div>