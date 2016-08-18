<%-- 
    Document   : areausuario
    Created on : 28/07/2016, 20:13:03
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>JSP Page</title>
    </head>
    <body>
        <my-tags:navbar/>
        <my-tags:navbar-login/>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 panel">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="nav-item">
                            <a class="nav-link" id="tela-perfil" >Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tela-historico" >Histórico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tela-pendentes">Pendentes</a>
                        </li>
                    </ul>
                </div>
                <my-tags:perfil-areausuario/>
                <my-tags:historico-areausuario/>
                <my-tags:pendentes-areausuario/>
                <my-tags:mensagem-input id="mensagem-input"
                                        id_btnConfirmar="btnConfirmarSenha"
                                        id_input="txSenhaConfirmada" 
                                        type_input="password" 
                                        titulo="Confirmar senha:" />


                <my-tags:mensagem-sim-nao classe_btnNAO="btn btn-default"
                                          classe_btnSIM="btn btn-danger" 
                                          texto_btnNAO="NÃO" 
                                          texto_btnSIM="SIM"
                                          texto_corpo="Deseja excluir o endereço?" 
                                          id_btnSIM="btnConfirmaExclusaoEndereco"
                                          />

                <my-tags:mensagem-ok id_btnOK="btnSenhaIncorreta" id="senhaIncorreta" mensagem="As senhas não coincidem!" />

            </div>
            <script src="resources/js/jquery.js"></script>
            <script src="resources/js/jquery-form.js"></script>
            <script src="resources/js/bootstrap.js"></script>
            <script src="resources/js/areausuario.js"></script>
    </body>
</html>
