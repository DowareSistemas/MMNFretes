<%-- 
    Document   : form-usuario
    Created on : 28/07/2016, 20:07:35
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<div id="formulario-usuario" class="form-group">
    <form role="form" action="cadastrausuario">
        <div class="form-group">
            <input type="text" name="nome" class="form-control center-block" placeholder="Nome">
        </div>
        <div class="form-group">
            <input type="text" name="email" class="form-control center-block" placeholder="Email">
        </div>
        <div class="form-group">
            <input type="password" name="senha" class="form-control center-block" placeholder="Senha">
        </div>
        <div class="form-group">
            <input type="password" class="form-control center-block" placeholder="Digite sua senha novamente">
        </div>

        <div class="checkbox">
            <label><input value="0" name="tipo_usuario" id="checkbox-transportadora" type="checkbox">Sou um transportador</label>
        </div>
        <button type="submit" class="btn btn-primary">Criar Conta</button>
    </form>
</div>