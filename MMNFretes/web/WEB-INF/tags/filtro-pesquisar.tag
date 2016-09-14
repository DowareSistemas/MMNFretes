<%-- Filtro da p�gina Pesquisar Fretes--%>

<div class="panel-body table-overflow"><br>
    <div class="row">
        <div class="btn-group btn-group-justified">
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#veiculos" aria-expanded="false" aria-controls="collapseExample">
                <h4 class="text-primary">Ve�culos</h4>
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
    <div class="collapse" id="veiculos">
        <div class="col-sm-4">
            <div class="well" style="height: 200px">
                <h5 class="text-muted text-uppercase text-center">Ve�culos Pesados</h5>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Rodotrem</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Bitrem</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Carreta LS</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Carreta</label>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="well" style="height: 200px">
                <h5 class="text-muted text-uppercase text-center">Ve�culos M�dios</h5>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Bitruck</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Truck</label>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="well"style="height: 200px">
                <h5 class="text-muted text-uppercase text-center">Ve�culos Leves</h5>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Toco</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> 3/4</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> V.L.C</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> V.U.C.</label>
                </div>
            </div>
        </div>
    </div>
    <div class="collapse" id="Carrocerias">
        <div class="col-sm-12">
            <div class="well">
                <h5 class="text-muted text-uppercase text-center">Tipos de carrocerias</h5>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Ba�</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Sider</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Ca�amba</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Grade Baixa</label>
                </div>
            </div>
        </div>
    </div>
    <div class="collapse" id="Rastreador">
        <div class="col-sm-12">
            <div class="well">
                <h5 class="text-muted text-uppercase text-center">Ve�culos com rastreador</h5>
                <div class="radio">
                    <label><input type="radio" name="optradio">Sim</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="optradio">N�o</label>
                </div>
            </div>
        </div>
    </div>
    <div class="collapse" id="Formas-de-Pagamento">
        <div class="col-sm-12">
            <div class="well">
                <h5 class="text-muted text-uppercase text-center">Formas de Pagamento</h5>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Boleto Banc�rio</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Cart�o de Cr�dito</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value=""> Negocia��o Direta</label>
                </div>
            </div>
        </div>
    </div>
</div>