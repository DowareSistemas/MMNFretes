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
                    <input type="checkbox" required> Li e concordo com os termos de uso! <a data-toggle="modal" data-target="#termos-usuario" title="Termos de uso">Termos de uso</a>.
                </label>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="btn btn-success btn-lg btn-block">Criar Conta</button>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="termos-usuario" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Termos de uso!</h4>
            </div>
            <div class="modal-body">
                <p class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vestibulum
                    nec justo consectetur porttitor. Nam pharetra volutpat blandit. Lorem
                    ipsum dolor sit amet, consectetur adipiscing elit. Nunc at vulputate
                    mi. Nullam purus urna, tincidunt at ipsum eget, dapibus malesuada felis.
                    Vestibulum at arcu at nisi vulputate tristique. Aliquam laoreet consectetur
                    efficitur. Nullam vehicula lorem vitae luctus dictum.
                </p>
                <p class="text-justify">
                    Suspendisse potenti. Mauris faucibus felis nulla. Integer quis lectus
                    eget mi gravida eleifend at vitae turpis. Etiam sollicitudin nisi
                    sem, condimentum malesuada nisl cursus vitae. Vivamus euismod quam
                    id odio tincidunt, nec auctor arcu vestibulum. Maecenas dolor nisi,
                    posuere volutpat venenatis posuere, facilisis nec arcu. Donec eleifend
                    fringilla tempus. Morbi vestibulum, ante porttitor rutrum posuere,
                    ex velit lacinia ante, sit amet iaculis massa ex nec quam. Orci 
                    varius natoque penatibus et magnis dis parturient montes, nascetur
                    ridiculus mus. Sed tincidunt, neque at imperdiet hendrerit, sem 
                    justo gravida nisi, eu tempus ipsum mauris eget augue.
                </p>
                <p class="text-justify">
                    Mauris eget ullamcorper mi. Etiam nec mi nec leo dignissim pretium.
                    Vivamus purus odio, maximus sit amet neque in, vehicula semper ante.
                    Nam auctor sem massa, sed tincidunt nisi scelerisque vel. Morbi 
                    ornare mollis diam, ut tincidunt justo auctor non. Fusce ut dapibus
                    odio. Praesent vitae erat enim. Vivamus pellentesque libero nec 
                    leo malesuada, sed ornare arcu auctor. Nulla ultrices purus eget 
                    mi tristique maximus condimentum nec leo. Praesent id mollis diam.
                    Nullam at diam sed odio mattis sollicitudin a et enim. Mauris vel
                    tellus quis nulla tincidunt dictum.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>