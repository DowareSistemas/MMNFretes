<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<div id="formulario-transportador" class="form-group">
    <form role="form" action="cadastratransportadora">
        <div class="form-group">
            <input type="text" name="nome" class="form-control center-block" placeholder="Nome">
        </div>
        <div class="form-group">
            <input type="text" name="usuarios.email" class="form-control center-block" placeholder="Email">
        </div>
        <div class="form-group">
            <input type="password" name="usuarios.senha" class="form-control center-block" placeholder="Senha">
        </div>
        <div class="form-group">
            <input type="password" class="form-control center-block" placeholder="Digite sua senha novamente">
        </div>

        <div  class="form-group">
            <input type="text"  name="ANTT" class="form-control center-block" placeholder="ANTT">
        </div>
        <div class="form-group">
            <input type="text" name="CPF_CNPJ" class="form-control center-block" placeholder="CPF ou CNPJ">
        </div>

        <div class="checkbox">
            <label><input value="1" id="checkbox-usuario" type="checkbox">Sou um usuário</label>
        </div>
        <button type="submit" class="btn btn-primary">Criar Conta</button>
    </form>
</div>