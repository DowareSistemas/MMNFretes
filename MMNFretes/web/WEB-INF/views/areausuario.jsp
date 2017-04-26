<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/areausuario/" prefix="areausuario"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<%@taglib tagdir="/WEB-INF/tags/pesquisarfretes/" prefix="pesquisarfretes" %>
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
        <title>Usuário - GC Fretes</title>
    </head>
    <body>
        <div class="container-fluid">
            <header>
                <my-tags:navbar />
                <pesquisarfretes:pesquisar-mapa />
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-aside">
                                <button class="btn btn-primary btn-block" type="button" id="tela-perfil">Perfil</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-enderecos">Endereços</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-historico">Histórico</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-pendentes">Fretes</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-pedidos">Produtos</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-lancamentos">Lançamentos</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="tela-representacoes">Representações</button><br>
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
                    <my-tags:confirmar-recebimento/>
                    <areausuario:modal-avaliacao/>
                    <areausuario:lancamentos/>
                    <areausuario:representacoes/>
                    <!-- Dinâmica da página -->
                    <backend:mensagem-input id="mensagem-input"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaConfirmada" 
                                            type_input="password" 
                                            titulo="Confirmar senha:" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-input id="mensagem-input"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaConfirmada" 
                                            type_input="password" 
                                            titulo="Confirmar senha:" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-input id="editar-grupo"
                                            id_btnConfirmar="btnSalvaGrupo"
                                            id_input="txNomeGrupo"
                                            titulo="Renomear grupo de cotações"
                                            type_input="text" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-sim-nao />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-ok id_btnOK="btnSenhaIncorreta" 
                                         id="senhaIncorreta"
                                         mensagem="As senhas não coincidem!" />
                    <!-- Modal de mais informações -->
                    <backend:detalhes-cotacao-usuario/>
                    <backend:mensagem-ok id="msgSUCAT" id_btnOK="btnSUCAT" mensagem="Selecione ao menos uma categoria de veículo!"/>
                    <backend:mensagem-ok id="msgSUCARR" id_btnOK="btnSUCARR" mensagem="Selecione ao menos uma carroceria de veículo!"/>
                    
                    <backend:mensagem-ok id="msgICO" id_btnOK="btnICO" mensagem="Informe o CEP de origem!"/>
                    <backend:mensagem-ok id="msgICD" id_btnOK="btnICD" mensagem="Informe o CEP de destino!"/>
                    <backend:mensagem-ok id="msgIC" id_btnOK="btnIC" mensagem="Informe o comprimento!"/>
                    <backend:mensagem-ok id="msgIA" id_btnOK="btnIA" mensagem="Informe a altura!"/>
                    <backend:mensagem-ok id="msgIL" id_btnOK="btnIL" mensagem="Informe a largura!"/>
                    <backend:mensagem-ok id="msgIV" id_btnOK="btnIV" mensagem="Informe os volumes!"/>
                </div>
            </main>
            <footer>

            </footer>
        </div>
        <!-- Scripts da página -->
        <script src="resources/js/ambientes.js"></script>
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
        <script src="resources/js/avaliacoes.js"></script>
        <script src="resources/js/areausuario.js"></script>
        <script src="resources/js/enderecos.js"></script>
        <script src="resources/js/historico.js"></script>
        <script src="resources/js/modal-centralizado.js"></script>
        <script src="resources/js/lancamentos.js"></script>
        <script src="resources/js/mensagens.js"></script>
        <script src="resources/js/navbar.js"></script>
        <script src="resources/js/login.js"></script>
        <script src="resources/js/maps.js"></script>
        <script src="resources/js/pesquisarfretes.js"></script>
        <script src="resources/js/representacoes.js"></script>

        <script>
            setRedirecionaPerfil(true);
        </script>
    </body>
</html>
