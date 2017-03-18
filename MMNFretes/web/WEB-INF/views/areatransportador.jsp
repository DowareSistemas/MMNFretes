<%-- 
    Document   : areatransportador
    Created on : 04/08/2016, 19:14:16
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/areatransportador" prefix="areatransportador"%>
<%@taglib tagdir="/WEB-INF/tags/backend/" prefix="backend"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <link href="resources/css/criarconta-entrar.css" rel="stylesheet" media="screen">
        <title>Transportador - GC Fretes</title>
    </head>
    <body>
        <div class="container-fluid">
            <header>
                <my-tags:navbar/>
            </header>
            <aside>
                <div class="aside-fixed">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-aside">
                                <button class="btn btn-primary btn-block" type="button" id="btnPerfil">Perfil</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnVeiculos">Veículos</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnEnderecos">Endereços</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnHistorico">Histórico</button><br>
                                <button class="btn btn-primary btn-block" type="button" id="btnPendentes">Pendentes</button><br>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
            <main>
                <div class="aside-fixed-main">
                    <!-- Conteúdo da página -->
                    <my-tags:enderecos-conjunto/>
                    <areatransportador:historico-areatransportador/>
                    <areatransportador:pendentes-areatransportador/>
                    <areatransportador:perfil-areatransportador/>
                    <areatransportador:veiculos-areatransportador/>
                    <!-- Dinâmica da página -->
                    <backend:mensagem-input id="alterarSenha"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaDigitada"
                                            titulo="Confirmar senha"
                                            type_input="password" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-ok id="senhaIncorreta" 
                                         id_btnOK="btnSenhaIncorreta"
                                         mensagem="As senhas não coincidem!" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-ok id="valid-campos"
                                         mensagem="Existem campos não preenchidos!" />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-ok id="valid-exclusao" 
                                         mensagem="Não é possível excluír este veículo. Ele está relacionado a uma ou mais cotações ou possui algum histórico de frete." />
                    <!-- Dinâmica da página -->
                    <backend:mensagem-sim-nao/>
                    <backend:detalhes-cotacao-transportador/>
                </div>
            </main>
            <footer>

            </footer>
        </div>
    </div>
    <!-- Scripts da página -->
    <script src="resources/js/ambientes.js"></script>
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery-form.js"></script>
    <script src="resources/js/jquery-mask.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAqRtKSC8hW8IRtlo9WdCaO-yvdaCVI5Ws&amp;"></script>
    <script src="resources/js/areatransportador.js"></script>
    <script src="resources/js/historico.js"></script>
    <script src="resources/js/enderecos.js"></script>
    <script src="resources/js/veiculos.js"></script>
    <script src="resources/js/jquery-mask.js"></script>
    <script src="resources/js/mascaras.js"></script>
    <script src="resources/js/mensagens.js"></script>
    <script src="resources/js/navbar.js"></script>
    <script src="resources/js/login.js"></script>

    <script>
        setRedirecionaPerfil(true);
    </script>
</body>
</html>
