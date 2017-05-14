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
                <h3 class="modal-title">Termos de Uso na Gestão Compartilhada de Fretes, Usuários e Representação.</h3>
            </div>
            <div class="modal-body">
                <h3><small>Sobre o Serviço Sistema Gestão Compartilhada de fretes, Usuário e Representações.</small></h3>
                <p class="text-justify">
                    A Gestão Compartilhada Fretes oferece o serviço de sistema de
                    agrupamento de fretes para os usuários cadastrados, que possibilita
                    o usuário fechar contrato diretamente com os anunciantes ou no
                    próprio sistema. 
                </p>
                <h4>CLÁUSULA PRIMEIRA <small>OBJETO E SUA DEFINIÇÃO</small></h4>
                <p><strong>1.1 - </strong>
                    O objeto do presente contrato é a prestação do serviço de divulgação dos fretes cadastrados no sistema para seus usuários cadastrados, visualização de produtos disponíveis para venda através do cadastro via representações.
                </p>
                <p><strong>1.2 - </strong>
                    No ato da contratação, o CONTRATANTE deverá escolher o perfil de seu veículo para o sistema filtrar sua categoria de fretes.
                </p>
                <p><strong>1.3 - </strong>
                    Para contratar o serviço de visualização de fretes via Sistema, o CONTRATANTE deverá ser assinante no Sistema para receber o usuário e ter acesso todos os dados do sistema e visualização de fretes, armazenagem e disponibilização de dados online no servidor do Site, como também todo extrato financeiro de suas entregas e possibilidade de vender produtos através do link representações.
                </p>
                <p><strong>1.4 - </strong>
                    O modelo de negócios do Sistema de fretes, representações e lançamento de fretes, será totalmente online e terá acesso via computador com acesso a internet e celulares com plataforma Android e IOS.
                </p>
                <p>Visualização do usuário;</p>
                <ul>
                    <li>Personalização de seu perfil com foto, telefone e email de contato;</li>
                    <li>Gestão à vista de seus contratos no sistema;</li>
                    <li>Controle dos fretes entregues;</li>
                    <li>Controle das Vendas no campo Representações;</li>
                    <li>Controle de fretes não entregues;</li>
                    <li>Recebimento de frete via cartão;</li>
                    <li>Realizar lançamentos de fretes no login de cliente;</li>
                    <li>Vantagens de participar do programa Redução de Carbono do Sistema.</li>
                </ul>
                <p><strong>1.5 - </strong>
                    A prestação do serviço se dará da seguinte forma:
                </p>
                <p><strong>1.5.a - </strong>
                    O CONTRATANTE irá escolher entre as opções conforme seu perfil dentro do Sistema, o próprio usuário irá fazer a configuração de seu perfil conforme suas necessidades.
                </p>
                <p><strong>1.5.b - </strong>
                    O CONTRATANTE terá acesso todos os fretes cadastrados no sistema conforme seu perfil cadastrado.
                </p>
                <p><strong>1.5.c - </strong>
                    O CONTRATANTE pode fechar o frete através de uma plataforma totalmente segura para recebimento através do programa Pag Seguro, este serviço está sujeito a taxas.
                </p>
                <p><strong>1.5.d - </strong>
                    O Sistema é pronto e está vinculado a outros serviços desta forma O CONTRATANTE, irá receber promoções contidas no programa de publicidade e promoções cadastrado no sistema.
                </p>
                <p><strong>1.5.e - </strong>
                    <strong>Para representações os usuários irá cadastrar seus produtos de interesse de vendas, e para cada venda realizada na plataforma será cobrado 10% de ágio e custo de transação do Mercado Pago, conforme descrito no item 2.2.a deste termo.</strong>
                </p>
                <p><strong>1.5.f - </strong>
                    Para Usuário Cliente não incide custos, este poderá realizar compras, vender produtos, lançar oportunidades de fretes, somente será cobrado o ágio conforme item 1.5.e, e taxa do Mercado Pago conforme item <strong>2.2.a</strong>.
                </p>
                <h4>CLÁUSULA SEGUNDA <small>PREÇO E CONDIÇÕES DE PAGAMENTO</small></h4>
                <p><strong>2.1 - </strong>
                    O serviço do Sistema segue uma remuneração tabelada, com valor específico e não negociável, conforme características dispostas no usuário da CONTRATANTE.
                </p>
                <p><strong>2.1.a - </strong>
                    O pagamento pelo serviço de visualização de fretes mensal será conforme usuários descritos nas tabelas de cadastros de usuários. O Pagamento é por meio de Boleto Bancário ou Cartão de Crédito, sendo liberadas as visualizações do usuário após confirmação do pagamento. 
                </p>
                <p><strong>Tabela de preços conforme apresentado no cadastro de Usuários.</strong></p>
                <p><strong>2.2 - </strong>
                    <strong>Nas transações feitas via sistema via Pagseguro será cobrado uma taxa de 5% do valor processado, para gestão de pagamentos.</strong>
                </p>
                <p><strong>2.3 - </strong>
                    Para pagamento anual desconto de 10% no valor total.
                </p>
                <p><strong>2.4 - </strong>
                    O atraso no pagamento do usuário no Sistema acarretará no congelamento de recebimento dos fretes disponíveis e serviços agregados.
                </p>
                <h4>CLÁUSULA TERCEIRA <small>VIGÊNCIA DO CONTRATO</small></h4>
                <p><strong>3.1 - </strong>
                    O contrato de prestação do serviço do Sistema de fretes terá vigência de 12 (doze) meses consecutivos, contados a partir do pagamento do pacote escolhido pelo CONTRATANTE, sendo automaticamente prorrogado por igual e sucessivo período enquanto não houver manifestação das partes em sentido diverso.
                </p>
                <h4>CLÁUSULA QUARTA <small>CONDIÇÕES DA PRESTAÇÃO DO SERVIÇO</small></h4>
                <p><strong>4.1 - </strong>
                    As responsabilidades referentes a CONTRATADA são divulgar todos fretes disponíveis conforme cadastro do usuário escolhido, divulgar os produtos cadastrados nas representações e realizar lançamento de frete conforme cada usuário cadastrou, e realizar sua gestão dentro de cada login.
                </p>
                <p><strong>4.1.a - </strong>
                    O usuário começará a receber visualizações de frete num prazo de 32 horas após comprovar seu pagamento no Sistema.
                </p>
                <p><strong>4.2 - </strong>
                    As responsabilidades do CONTRATANTE são, preencher corretamente os dados solicitados, escolher uma das opções de perfil disponíveis, participar da pesquisa de satisfação mensal, preencher os arquivos relacionados ao conteúdo do sistema (logomarca, imagens, textos e etc.) e verificar se as informações contidas no sistema estão corretas.
                </p>
                <p><strong>4.3 - </strong>
                    Após a confirmação do pagamento, a CONTRATADA terá 32 horas para, somente no caso de transportador:
                </p>
                <ul>
                    <li>Identificar o pagamento do usuário;</li>
                    <li>Confirmar o usuário no sistema;</li>
                    <li>Enviar disponibilidades de fretes conforme perfil do usuário.</li>
                </ul>
                <h4>CLÁUSULA QUINTA <small>CONDIÇÕES DE RESCISÃO CONTRATUAL</small></h4>
                <p><strong>5.1 - </strong>
                    Em caso de rescisão do contrato em período inferior a 12 meses, será cobrada uma taxa de cinqüenta reais (R$ 50,00) para desmobilização do usuário no Sistema.
                </p>
                <p><strong>5.1a - </strong>
                    Fica estabelecido o prazo máximo de 7 (sete) dias, a contar da data de publicação do usuário no Sistema, para requisição de reembolso integral de valores pagos à CONTRATADA, respeitando o disposto no código de defesa do consumidor. 
                </p>
                <p><strong>5.2 - </strong>
                    Após o período máximo de 7 (sete) dias os valores pagos pelo CONTRATANTE referentes ao pacote de serviços do Sistema não lhe serão ressarcidos a nenhum título, na venda de produtos os valores serão devolvidos com desconto das taxas dos itens <strong>1.5.e</strong> e <strong>2.2.a</strong>, da mesma forma será feito para pagamento realizados de fretes dentro da plataforma seram descontados as taxas dos itens citados.
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
