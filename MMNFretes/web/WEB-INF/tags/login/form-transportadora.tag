<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<div id="formulario-transportador" class="form form-group">
    <form role="form" action="cadastratransportadora" method="POST">
        <div class="row">
            <div class="form-group col-md-12">
                <label>Nome:</label>
                <input type="text" name="nome" class="form-control" title="Nome" required>
            </div>
            <div class="form-group col-md-12">
                <label>Email:</label>
                <input type="email" name="usuarios.email" class="form-control" title="Email" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha:</label>
                <input type="password" name="usuarios.senha" class="form-control" title="Senha" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha novamente:</label>
                <input type="password" class="form-control" title="Senha novamente" required>
            </div>
            <div class="form-group col-md-12">
                <label>Número ANTT:</label>
                <input type="tel"  name="ANTT" class="form-control mask-antt" title="Número ANTT" required>
            </div>
            <div class="form-group col-md-12">
                <label>Número CPF ou CNPJ:</label>
                <input type="tel" name="CPF_CNPJ" class="form-control mask-cpf-cnpj" title="Número CPF ou CNPJ" required>
            </div>
            <!--Escolha do plano de pagamento do transportador-->
            <div class="form-group col-md-12">
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="participativo" required> <strong class="text-primary">Plano participativo: </strong><strong>5% (cinco porcento)</strong> do valor de cada transporte realizado.</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="mensal" required>
                        <strong class="text-primary">Plano Mensal:</strong> Valor pago a cada mês de acordo com a <strong>quantidade e tipo de veículo</strong>. Confira os valores para cada veiculo <a href="#" class="link-panel" title="Valores dos veículos">clicando aqui</a>.</label>
                </div>
            </div>
            <div class="form-group col-md-12">
                <label>
                    <input type="checkbox" required> Li e concordo com os termos de uso! <a href="" class="link-panel" title="Termos de uso">Termos de uso</a>.
                </label>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="btn btn-success btn-lg btn-block">Criar Conta</button>
            </div>
        </div>
    </form>
</div>
