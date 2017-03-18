<%-- 
    Document   : criarconta-entrar
    Created on : 05/12/2016, 14:03:13
    Author     : Marcos Vinícius
--%>

<div class="modal fade modal-centralizado" data-backdrop="static" data-keyboard="false" id="criarconta-entrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"> Criar conta / Entrar </h4>
            </div>
            <div class="modal-body">
                <p>
                    Faça login na sua conta da GC Fretes® para continuar a cotação. 
                </p>
                <p>
                    Ainda não possui conta? Registre-se, é gratuito!
                </p>

                <div class="row">
                    <div class="col-md-6 border-left">
                        <h4> Entrar </h4>

                        <form action="" method="POST" id="form-criarconta-login">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Email:</label>
                                    <input type="text" name="email" class="form-control"/>
                                </div>
                            </div>

                            <br/>

                            <div class="row">
                                <div class="col-md-12">
                                    <label>Senha:</label>
                                    <input type="password" name="senha" class="form-control"/>
                                </div>
                            </div>

                            <br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <input type="button" id="btnEntrar" class="btn btn-primary" value="Entrar"/>
                                </div>
                                <div class="col-md-8">
                                    <label>Esqueceu a senha?</label>
                                </div>
                            </div>
                            
                            <br/>
                            <div class="row">
                                <div class="col-md-12 center-block" >
                                    <label class="h4" id="lbIncorretos"> Email ou senha incorretos </label>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6 border-left">
                        <h4> Criar conta </h4>
                        <form role="form" action="cadastrausuario" method="POST">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Nome:</label>
                                    <input type="text" name="nome" class="form-control" title="Nome" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Email:</label>
                                    <input type="email" name="email" class="form-control" title="Email" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Senha:</label>
                                    <input type="password" name="senha" class="form-control" title="Senha" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Confirmar senha:</label>
                                    <input type="password" class="form-control" title="Confirmar senha" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <button type="submit" class="btn btn-success btn-block">Criar Conta</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>