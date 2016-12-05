<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/areausuario/" prefix="areausuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <header>
                <my-tags:navbar/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-aside">
                                <button class="btn btn-primary btn-block" type="button" id="tela-perfil">Perfil</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-enderecos">Endereços</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-historico">Histórico</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-pendentes">Pendentes</button><br>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <main>
                <div class="aside-fixed-main">
                    <!-- Conteúdo da página -->
                    <areausuario:perfil-areausuario/>
                    <my-tags:enderecos-conjunto/>
                    <areausuario:historico-areausuario/>
                    <areausuario:pendentes-areausuario/>
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-input id="mensagem-input"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaConfirmada" 
                                            type_input="password" 
                                            titulo="Confirmar senha:" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-input id="mensagem-input"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaConfirmada" 
                                            type_input="password" 
                                            titulo="Confirmar senha:" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-input id="editar-grupo"
                                            id_btnConfirmar="btnSalvaGrupo"
                                            id_input="txNomeGrupo"
                                            titulo="Renomear grupo"
                                            type_input="text" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-sim-nao classe_btnNAO="btn btn-default"
                                              classe_btnSIM="btn btn-danger" 
                                              texto_btnNAO="NÃO" 
                                              texto_btnSIM="SIM"
                                              texto_corpo="Deseja excluir o endereço?" 
                                              id_btnSIM="btnConfirmaExclusaoEndereco" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-ok id_btnOK="btnSenhaIncorreta" 
                                         id="senhaIncorreta"
                                         mensagem="As senhas não coincidem!" />
                    <!-- Modal de mais informações -->
                    <my-tags:detalhes_cotacao_usuario/>
                </div>
            </main>
            <footer>

            </footer>
        </div>
        <!-- Scripts da página -->
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/areausuario.js"></script>
        <script src="resources/js/modal-centralizado.js"></script>
        <!-- Scripts de mascara para inputs -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
    </body>
</html>
