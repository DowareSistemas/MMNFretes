<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<div id="formulario-transportador" class="form form-group">
    <form role="form" action="cadastratransportadora" method="POST">
        <div class="row">
            <div class="form-group col-md-12">
                <label>Nome:</label>
                <input type="text" name="nome" class="form-control" title="Nome" required>
            </div>
            <div class="form-group col-md-12">
                <label>Email:</label>
                <input type="email" name="usuarios.email" class="form-control" title="Email" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha:</label>
                <input type="password" name="usuarios.senha" class="form-control" title="Senha" required>
            </div>
            <div class="form-group col-md-12">
                <label>Senha novamente:</label>
                <input type="password" class="form-control" title="Senha novamente" required>
            </div>
            <div class="form-group col-md-12">
                <label>Número ANTT (RNTC):</label>
                <input type="tel"  name="ANTT" class="form-control mask-antt" title="Número ANTT" required>
            </div>
            <div class="form-group col-md-12">
                <label>Número CPF ou CNPJ:</label>
                <input type="tel" name="CPF_CNPJ" class="form-control mask-cpf-cnpj" title="Número CPF ou CNPJ" required>
            </div>
            <!--Escolha do plano de pagamento do transportador-->
            <div class="form-group col-md-12">
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="participativo" required> <strong class="text-primary">Plano participativo: </strong><strong>5% (cinco porcento)</strong> do valor de cada transporte realizado.</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="mensal" required>
                        <strong class="text-primary">Plano Mensal:</strong> Valor pago a cada mês de acordo com a <strong>quantidade e categoria de veículo</strong>. Confira os valores para cada categoria <a data-toggle="modal" data-target="#plano-mensal" title="Valores das categoriasqqqqqqqqqqqqq">clicando aqui</a>.</label>
                </div>
            </div>
            <div class="form-group col-md-12">
                <label>
                    <input type="checkbox" required> Li e concordo com os termos de uso! <a data-toggle="modal" data-target="#termos-transportador" title="Termos de uso">Termos de uso</a>.
                </label>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="btn btn-success btn-lg btn-block">Criar Conta</button>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="termos-transportador" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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

<div class="modal fade" id="plano-mensal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Valores das categorias</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-responsive">
                    <thead>
                    <tr>
                        <th class="text-center">
                            Categorias de veículos
                        </th>
                        <th class="text-center">
                            Valor mesal
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Toco
                            </td>
                            <td class="text-center">R$ 1,00</td>
                        </tr>
                        <tr>
                            <td>
                                3/4
                            </td>
                            <td class="text-center">R$ 1,00</td>
                        </tr>
                        <tr>
                            <td>
                                Veículo Leve de Carga
                            </td>
                            <td class="text-center">R$ 0,50</td>
                        </tr>
                        <tr>
                            <td>
                                Veículo Urbano de Carga
                            </td>
                            <td class="text-center">R$ 0,50</td>
                        </tr>
                        <tr>
                            <td>
                                Truck
                            </td>
                            <td class="text-center">R$ 2,00</td>
                        </tr>
                        <tr>
                            <td>
                                Bitruck
                            </td>
                            <td class="text-center">R$ 2,00</td>
                        </tr>
                        <tr>
                            <td>
                                Rodotrem
                            </td>
                            <td class="text-center">R$ 5,00</td>
                        </tr>
                        <tr>
                            <td>
                                Bitrem
                            </td>
                            <td class="text-center">R$ 5,00</td>
                        </tr>
                        <tr>
                            <td>
                                Carreta LS
                            </td>
                            <td class="text-center">R$ 4,00</td>
                        </tr>
                        <tr>
                            <td>
                                Carreta
                            </td>
                            <td class="text-center">R$ 4,00</td>
                        </tr>
                    </tbody>
                </table>                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>
