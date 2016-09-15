<%-- Filtro da página Pesquisar Fretes--%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<!DOCTYPE html>

<div class="panel-body"><br>
    <div class="row">
        <div class="btn-group btn-group-justified">
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                <h4 class="text-primary">Veículos</h4>
            </button>
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#Carrocerias" aria-expanded="false" aria-controls="collapseExample">
                <h4 class="text-primary">Carrocerias</h4>
            </button>
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#Rastreador" aria-expanded="false" aria-controls="collapseExample">
                <h4 class="text-primary">Rastreador</h4>
            </button>
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#Formas-de-Pagamento" aria-expanded="false" aria-controls="collapseExample">
                <h4 class="text-primary">Formas de Pagamento</h4>
            </button>
        </div>
    </div>
    <my-tags:veiculos-filtro-pesquisar/>
    <my-tags:carrocerias-filtro-pesquisar/>
    <my-tags:rastreador-filtro-pesquisar/>
    <my-tags:formasdepagamento-filtro-pesquisar/> 
</div>