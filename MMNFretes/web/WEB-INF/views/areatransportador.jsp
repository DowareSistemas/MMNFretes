<%-- 
    Document   : areatransportador
    Created on : 04/08/2016, 19:14:16
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="resources/css/estilo.css" rel="stylesheet" media="screen">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 panel">
                    <br>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="nav-item">
                            <a class="nav-link" id="btnPerfil">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btnVeiculos">Veículos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btnEnderecos">Endereços</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btnHistorico">Histórico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="btnPendentes">Pendentes</a>
                        </li>
                    </ul>
                    <br/>
                </div>
                <my-tags:historico-areatransportador/>
                <my-tags:pendentes-areatransportador/>
                <my-tags:perfil-areatransportador/>
                <my-tags:veiculos-areatransportador/>

                <my-tags:mensagem-input id="alterarSenha"
                                        id_btnConfirmar="btnConfirmarSenha"
                                        id_input="txSenhaDigitada"
                                        titulo="Confirmar senha"
                                        type_input="password" />

                <my-tags:mensagem-ok id="senhaIncorreta" id_btnOK="btnSenhaIncorreta"
                                     mensagem="As senhas não coincidem!" />

                <my-tags:mensagem-ok id="valid-campos"
                                     mensagem="Existem campos não preenchidos!" />

                <my-tags:mensagem-ok id="valid-exclusao" 
                                     mensagem="Não é possível excluír este veículo. Ele está relacionado a uma ou mais cotações ou possui algum histórico." />

                <my-tags:mensagem-sim-nao classe_btnNAO="btn btn-default"
                                          classe_btnSIM="btn btn-danger" 
                                          texto_btnNAO="NÃO" 
                                          texto_btnSIM="SIM"
                                          texto_corpo="Deseja excluir o veículo?" 
                                          id_btnSIM="btnConf_del_veiculo" />

            </div>
        </div>
        <!-- Scripts da página -->
        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/jquery-form.js"></script>
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/areausuario.js"></script>
        <script src="resources/js/areatransportador.js"></script>
        <script src="resources/js/veiculos.js"></script>
        <!-- Scripts de mascara para inputs -->
        <script src="resources/js/jquery-mask.js"></script>
        <script src="resources/js/mascaras.js"></script>
    </body>
</html>
