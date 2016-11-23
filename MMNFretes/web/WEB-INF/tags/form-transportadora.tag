<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<article>
    <div class="row">
        <div class="col-md-12">
            <div id="formulario-transportador" class="form form-group">
                <form role="form" action="cadastratransportadora" method="POST">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Nome:</label>
                            <input type="text" name="nome" class="form-control" title="Nome" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Email:</label>
                            <input type="email" name="usuarios.email" class="form-control" title="Email" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Senha:</label>
                            <input type="password" name="usuarios.senha" class="form-control" title="Senha" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Senha novamente:</label>
                            <input type="password" class="form-control" title="Senha novamente" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Número ANTT:</label>
                            <input type="text"  name="ANTT" class="form-control" title="Número ANTT" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Número CPF ou CNPJ:</label>
                            <input type="text" name="CPF_CNPJ" class="form-control" title="Número CPF ou CNPJ" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <button type="submit" class="btn btn-primary">Criar Conta</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</article>