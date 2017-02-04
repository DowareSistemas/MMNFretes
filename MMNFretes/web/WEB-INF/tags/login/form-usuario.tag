<%-- 
    Document   : form-usuario
    Created on : 28/07/2016, 20:07:35
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<div id="formulario-usuario" class="form form-group">
    <form role="form" action="cadastrausuario" method="POST">
        <div class="row">
            <div class="form-group col-md-12">
                <label>Nome:</label>
                <input type="text" name="nome" class="form-control" title="Nome" required>
            </div>
            <div class="form-group col-md-12">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" title="Email" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha:</label>
                <input type="password" name="senha" class="form-control" title="Senha" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha novamente</label>
                <input type="password" class="form-control" title="Senha novamente" required>
            </div>
            <div class="form-group col-md-12">
                <label>
                    <input type="checkbox" required> Li e concordo com os termos de uso! <a href="" title="Termos de uso">Termos de uso</a>.
                </label>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="btn btn-success btn-lg btn-block">Criar Conta</button>
            </div>
        </div>
    </form>
</div>