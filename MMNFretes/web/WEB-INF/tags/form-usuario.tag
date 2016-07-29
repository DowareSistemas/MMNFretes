<%-- 
    Document   : form-usuario
    Created on : 28/07/2016, 20:07:35
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>


<div id="formulario-usuario" class="form-group">
    <form role="form" action="cadastrausuario" method="POST">
        <div class="form-group">
            <input type="text" name="nome" class="form-control center-block" placeholder="Nome" required>
        </div>
        <div class="form-group">
            <input type="email" name="email" class="form-control center-block" placeholder="Email" required>
        </div>
        <div class="form-group">
            <input type="password" name="senha" class="form-control center-block" placeholder="Senha" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control center-block" placeholder="Digite sua senha novamente" required>
        </div>

        <div class="btn btn-link pull-right">
            <label class="btn btn-link" id="transportador">Sou um transportador</label>
        </div>
        <button type="submit" class="btn btn-primary">Criar Conta</button>
    </form>
</div>