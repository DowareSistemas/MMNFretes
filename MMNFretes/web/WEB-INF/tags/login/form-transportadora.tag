<%-- 
    Document   : form-transportadora
    Created on : 28/07/2016, 20:10:16
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<div id="formulario-transportador" class="form form-group">
    <form role="form" action="cadastratransportadora" method="POST">
        <div class="row">
            <div class="form-group col-md-12">
                <label>Nome Completo:</label>
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
                <label>N�mero ANTT (RNTC):</label>
                <input type="tel"  name="ANTT" class="form-control mask-antt" title="N�mero ANTT" required>
            </div>
            <div class="form-group col-md-12">
                <label>N�mero CPF ou CNPJ:</label>
                <input type="tel" name="CPF_CNPJ" class="form-control mask-cpf-cnpj" title="N�mero CPF ou CNPJ" required>
            </div>
            <!--Escolha do plano de pagamento do transportador-->
            <div class="form-group col-md-12">
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="participativo" required> <strong class="text-primary">Plano participativo: </strong><strong>5% (cinco porcento)</strong> do valor de cada transporte realizado.</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="Plano escolhido" id="mensal" required>
                        <strong class="text-primary">Plano Mensal:</strong> Valor pago a cada m�s de acordo com a <strong>quantidade e categoria de ve�culo</strong>. Confira os valores para cada categoria <a data-toggle="modal" data-target="#plano-mensal" title="Valores das categoriasqqqqqqqqqqqqq">clicando aqui</a>.</label>
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
                <h3 class="modal-title">Termos de Uso na Gest�o Compartilhada de Fretes, Usu�rios e Representa��o.</h3>
            </div>
            <div class="modal-body">
                <h3><small>Sobre o Servi�o Sistema Gest�o Compartilhada de fretes, Usu�rio e Representa��es.</small></h3>
                <p class="text-justify">
                    A Gest�o Compartilhada Fretes oferece o servi�o de sistema de
                    agrupamento de fretes para os usu�rios cadastrados, que possibilita
                    o usu�rio fechar contrato diretamente com os anunciantes ou no
                    pr�prio sistema. 
                </p>
                <h4>CL�USULA PRIMEIRA <small>OBJETO E SUA DEFINI��O</small></h4>
                <p><strong>1.1 - </strong>
                    O objeto do presente contrato � a presta��o do servi�o de divulga��o dos fretes cadastrados no sistema para seus usu�rios cadastrados, visualiza��o de produtos dispon�veis para venda atrav�s do cadastro via representa��es.
                </p>
                <p><strong>1.2 - </strong>
                    No ato da contrata��o, o CONTRATANTE dever� escolher o perfil de seu ve�culo para o sistema filtrar sua categoria de fretes.
                </p>
                <p><strong>1.3 - </strong>
                    Para contratar o servi�o de visualiza��o de fretes via Sistema, o CONTRATANTE dever� ser assinante no Sistema para receber o usu�rio e ter acesso todos os dados do sistema e visualiza��o de fretes, armazenagem e disponibiliza��o de dados online no servidor do Site, como tamb�m todo extrato financeiro de suas entregas e possibilidade de vender produtos atrav�s do link representa��es.
                </p>
                <p><strong>1.4 - </strong>
                    O modelo de neg�cios do Sistema de fretes, representa��es e lan�amento de fretes, ser� totalmente online e ter� acesso via computador com acesso a internet e celulares com plataforma Android e IOS.
                </p>
                <p>Visualiza��o do usu�rio;</p>
                <ul>
                    <li>Personaliza��o de seu perfil com foto, telefone e email de contato;</li>
                    <li>Gest�o � vista de seus contratos no sistema;</li>
                    <li>Controle dos fretes entregues;</li>
                    <li>Controle das Vendas no campo Representa��es;</li>
                    <li>Controle de fretes n�o entregues;</li>
                    <li>Recebimento de frete via cart�o;</li>
                    <li>Realizar lan�amentos de fretes no login de cliente;</li>
                    <li>Vantagens de participar do programa Redu��o de Carbono do Sistema.</li>
                </ul>
                <p><strong>1.5 - </strong>
                    A presta��o do servi�o se dar� da seguinte forma:
                </p>
                <p><strong>1.5.a - </strong>
                    O CONTRATANTE ir� escolher entre as op��es conforme seu perfil dentro do Sistema, o pr�prio usu�rio ir� fazer a configura��o de seu perfil conforme suas necessidades.
                </p>
                <p><strong>1.5.b - </strong>
                    O CONTRATANTE ter� acesso todos os fretes cadastrados no sistema conforme seu perfil cadastrado.
                </p>
                <p><strong>1.5.c - </strong>
                    O CONTRATANTE pode fechar o frete atrav�s de uma plataforma totalmente segura para recebimento atrav�s do programa Pag Seguro, este servi�o est� sujeito a taxas.
                </p>
                <p><strong>1.5.d - </strong>
                    O Sistema � pronto e est� vinculado a outros servi�os desta forma O CONTRATANTE, ir� receber promo��es contidas no programa de publicidade e promo��es cadastrado no sistema.
                </p>
                <p><strong>1.5.e - </strong>
                    <strong>Para representa��es os usu�rios ir� cadastrar seus produtos de interesse de vendas, e para cada venda realizada na plataforma ser� cobrado 10% de �gio e custo de transa��o do Mercado Pago, conforme descrito no item 2.2.a deste termo.</strong>
                </p>
                <p><strong>1.5.f - </strong>
                    Para Usu�rio Cliente n�o incide custos, este poder� realizar compras, vender produtos, lan�ar oportunidades de fretes, somente ser� cobrado o �gio conforme item 1.5.e, e taxa do Mercado Pago conforme item <strong>2.2.a</strong>.
                </p>
                <h4>CL�USULA SEGUNDA <small>PRE�O E CONDI��ES DE PAGAMENTO</small></h4>
                <p><strong>2.1 - </strong>
                    O servi�o do Sistema segue uma remunera��o tabelada, com valor espec�fico e n�o negoci�vel, conforme caracter�sticas dispostas no usu�rio da CONTRATANTE.
                </p>
                <p><strong>2.1.a - </strong>
                    O pagamento pelo servi�o de visualiza��o de fretes mensal ser� conforme usu�rios descritos nas tabelas de cadastros de usu�rios. O Pagamento � por meio de Boleto Banc�rio ou Cart�o de Cr�dito, sendo liberadas as visualiza��es do usu�rio ap�s confirma��o do pagamento. 
                </p>
                <p><strong>Tabela de pre�os conforme apresentado no cadastro de Usu�rios.</strong></p>
                <p><strong>2.2 - </strong>
                    <strong>Nas transa��es feitas via sistema via Pagseguro ser� cobrado uma taxa de 5% do valor processado, para gest�o de pagamentos.</strong>
                </p>
                <p><strong>2.3 - </strong>
                    Para pagamento anual desconto de 10% no valor total.
                </p>
                <p><strong>2.4 - </strong>
                    O atraso no pagamento do usu�rio no Sistema acarretar� no congelamento de recebimento dos fretes dispon�veis e servi�os agregados.
                </p>
                <h4>CL�USULA TERCEIRA <small>VIG�NCIA DO CONTRATO</small></h4>
                <p><strong>3.1 - </strong>
                    O contrato de presta��o do servi�o do Sistema de fretes ter� vig�ncia de 12 (doze) meses consecutivos, contados a partir do pagamento do pacote escolhido pelo CONTRATANTE, sendo automaticamente prorrogado por igual e sucessivo per�odo enquanto n�o houver manifesta��o das partes em sentido diverso.
                </p>
                <h4>CL�USULA QUARTA <small>CONDI��ES DA PRESTA��O DO SERVI�O</small></h4>
                <p><strong>4.1 - </strong>
                    As responsabilidades referentes a CONTRATADA s�o divulgar todos fretes dispon�veis conforme cadastro do usu�rio escolhido, divulgar os produtos cadastrados nas representa��es e realizar lan�amento de frete conforme cada usu�rio cadastrou, e realizar sua gest�o dentro de cada login.
                </p>
                <p><strong>4.1.a - </strong>
                    O usu�rio come�ar� a receber visualiza��es de frete num prazo de 32 horas ap�s comprovar seu pagamento no Sistema.
                </p>
                <p><strong>4.2 - </strong>
                    As responsabilidades do CONTRATANTE s�o, preencher corretamente os dados solicitados, escolher uma das op��es de perfil dispon�veis, participar da pesquisa de satisfa��o mensal, preencher os arquivos relacionados ao conte�do do sistema (logomarca, imagens, textos e etc.) e verificar se as informa��es contidas no sistema est�o corretas.
                </p>
                <p><strong>4.3 - </strong>
                    Ap�s a confirma��o do pagamento, a CONTRATADA ter� 32 horas para, somente no caso de transportador:
                </p>
                <ul>
                    <li>Identificar o pagamento do usu�rio;</li>
                    <li>Confirmar o usu�rio no sistema;</li>
                    <li>Enviar disponibilidades de fretes conforme perfil do usu�rio.</li>
                </ul>
                <h4>CL�USULA QUINTA <small>CONDI��ES DE RESCIS�O CONTRATUAL</small></h4>
                <p><strong>5.1 - </strong>
                    Em caso de rescis�o do contrato em per�odo inferior a 12 meses, ser� cobrada uma taxa de cinq�enta reais (R$ 50,00) para desmobiliza��o do usu�rio no Sistema.
                </p>
                <p><strong>5.1a - </strong>
                    Fica estabelecido o prazo m�ximo de 7 (sete) dias, a contar da data de publica��o do usu�rio no Sistema, para requisi��o de reembolso integral de valores pagos � CONTRATADA, respeitando o disposto no c�digo de defesa do consumidor. 
                </p>
                <p><strong>5.2 - </strong>
                    Ap�s o per�odo m�ximo de 7 (sete) dias os valores pagos pelo CONTRATANTE referentes ao pacote de servi�os do Sistema n�o lhe ser�o ressarcidos a nenhum t�tulo, na venda de produtos os valores ser�o devolvidos com desconto das taxas dos itens <strong>1.5.e</strong> e <strong>2.2.a</strong>, da mesma forma ser� feito para pagamento realizados de fretes dentro da plataforma seram descontados as taxas dos itens citados.
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
                                Categorias de ve�culos
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
                                Ve�culo Leve de Carga
                            </td>
                            <td class="text-center">R$ 0,50</td>
                        </tr>
                        <tr>
                            <td>
                                Ve�culo Urbano de Carga
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
