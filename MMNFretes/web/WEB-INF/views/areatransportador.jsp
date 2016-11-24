<%-- 
    Document   : areatransportador
    Created on : 04/08/2016, 19:14:16
    Author     : emers
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="my-tags"%>
<%@taglib tagdir="/WEB-INF/tags/areatransportador" prefix="areatransportador"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                    <my-tags:mensagem-input id="alterarSenha"
                                            id_btnConfirmar="btnConfirmarSenha"
                                            id_input="txSenhaDigitada"
                                            titulo="Confirmar senha"
                                            type_input="password" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-ok id="senhaIncorreta" id_btnOK="btnSenhaIncorreta"
                                         mensagem="As senhas nï¿½o coincidem!" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-ok id="valid-campos"
                                         mensagem="Existem campos nï¿½o preenchidos!" />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-ok id="valid-exclusao" 
                                         mensagem="Nï¿½o ï¿½ possï¿½vel excluï¿½r este veï¿½culo. Ele estï¿½ relacionado a uma ou mais cotaï¿½ï¿½es ou possui algum histï¿½rico." />
                    <!-- Dinâmica da página -->
                    <my-tags:mensagem-sim-nao classe_btnNAO="btn btn-default"
                                              classe_btnSIM="btn btn-danger" 
                                              texto_btnNAO="NÃO" 
                                              texto_btnSIM="SIM"
                                              texto_corpo="Deseja excluir o veículo?" 
                                              id_btnSIM="btnConf_del_veiculo" />
                </div>
            </main>
            <footer>

            </footer>
        </div>





        <%-- <div class="row">
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
            <my-tags:enderecos-conjunto/>
            <areatransportador:historico-areatransportador/>
            <areatransportador:pendentes-areatransportador/>
            <areatransportador:perfil-areatransportador/>
            <areatransportador:veiculos-areatransportador/>

                <my-tags:mensagem-input id="alterarSenha"
                                        id_btnConfirmar="btnConfirmarSenha"
                                        id_input="txSenhaDigitada"
                                        titulo="Confirmar senha"
                                        type_input="password" />

                <my-tags:mensagem-ok id="senhaIncorreta" id_btnOK="btnSenhaIncorreta"
                                     mensagem="As senhas nï¿½o coincidem!" />

                <my-tags:mensagem-ok id="valid-campos"
                                     mensagem="Existem campos nï¿½o preenchidos!" />

                <my-tags:mensagem-ok id="valid-exclusao" 
                                     mensagem="Nï¿½o ï¿½ possï¿½vel excluï¿½r este veï¿½culo. Ele estï¿½ relacionado a uma ou mais cotaï¿½ï¿½es ou possui algum histï¿½rico." />

                <my-tags:mensagem-sim-nao classe_btnNAO="btn btn-default"
                                          classe_btnSIM="btn btn-danger" 
                                          texto_btnNAO="Nï¿½O" 
                                          texto_btnSIM="SIM"
                                          texto_corpo="Deseja excluir o veï¿½culo?" 
                                          id_btnSIM="btnConf_del_veiculo" />

            </div> --%>
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
