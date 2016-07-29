<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<div id="formulario-transportador" class="form-group">
    <form role="form" action="cadastratransportadora" method="POST">
        <div class="form-group">
            <input type="text" name="nome" class="form-control center-block" placeholder="Nome" required>
        </div>
        <div class="form-group">
            <input type="email" name="usuarios.email" class="form-control center-block" placeholder="Email" required>
        </div>
        <div class="form-group">
            <input type="password" name="usuarios.senha" class="form-control center-block" placeholder="Senha" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control center-block" placeholder="Digite sua senha novamente" required>
        </div>

        <div  class="form-group">
            <input type="text"  name="ANTT" class="form-control center-block" placeholder="ANTT" required>
        </div>
        <div class="form-group">
            <input type="text" name="CPF_CNPJ" class="form-control center-block" placeholder="CPF ou CNPJ" required>
        </div>

        <div class="btn btn-link pull-right">
            <label class="btn btn-link" id="usuario">Sou um usu�rio</label>
        </div>
        <button type="submit" class="btn btn-primary">Criar Conta</button>
    </form>
</div>