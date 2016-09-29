$(document).ready(function ()
{
    $('#veiculos-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();

    $('#btnSalvar-info').hide();
 
    carregaInfoTransportador();
    hab_desab_formInfo(true);
});

$('#btnPerfil').click(function ()
{
    $('#perfil-area-transportador').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
});

$('#btnVeiculos').click(function ()
{
    $('#veiculos-area-transportador').fadeIn(200);
    $('#enderecos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnEnderecos').click(function ()
{
    $('#enderecos-area-transportador').fadeIn(200);
    $('#veiculos-area-transportador').hide();
    $('#historico-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnHistorico').click(function ()
{
    $('#historico-area-transportador').fadeIn(200);
    $('#enderecos-area-transportador').hide();
    $('#veiculos-area-transportador').hide();
    $('#pendentes-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

$('#btnPendentes').click(function ()
{
    $('#pendentes-area-transportador').fadeIn(200);
    $('#historico-area-transportador').hide();
    $('#enderecos-area-transportador').hide();
    $('#veiculos-area-transportador').hide();
    $('#perfil-area-transportador').hide();
});

function carregaInfoTransportador()
{
    $.ajax
            ({
                url: "/mmnfretes/infoTransportador",
                dataType: 'json',
                accepts: "application/json",
                success: function (transportador_result)
                {
                    $('#txCPF_CNPJ').val(transportador_result.CPF_CNPJ);
                    $('#txANTT').val(transportador_result.ANTT);
                    $('#txWebsite').val(transportador_result.website);

                    if (transportador_result.cartao === true)
                    {
                        $('#Cartao').prop('checked', true);
                    }

                    if (transportador_result.boleto === true)
                    {
                        $('#Boleto').prop('checked', true);
                    }

                    if (transportador_result.negociacao_direta === true)
                    {
                        $('#NegociacaoDireta').prop('checked', true);
                    }
                }
            });

    $.ajax({
        url: "/mmnfretes/infoUsuario",
        dataType: 'json',
        accepts: "application/json",
        success: function (usuario_result)
        {
            $('#txNome').val(usuario_result.nome);
            $('#txTelefone1').val(usuario_result.telefone1);
            $('#txTelefone2').val(usuario_result.telefone2);
            $('#txEmail').val(usuario_result.email);
            $('#txSenha').val(usuario_result.senha);
        }
    });
}

$('#btnEditarInfo').click(function ()
{
    $('#btnSalvar-info').fadeIn(200);
    $('#btnEditarInfo').hide();
    hab_desab_formInfo(false);
});

$('#btnSalvar-info').click(function ()
{
    $('#alterarSenha').modal('toggle');
    $('#alterarSenha').modal('show');
});

function hab_desab_formInfo(estado)
{
    $('#txNome').prop('disabled', estado);
    $('#txEmail').prop('disabled', estado);
    $('#txSenha').prop('disabled', estado);
    $('#txTelefone1').prop('disabled', estado);
    $('#txTelefone2').prop('disabled', estado);
    $('#txCPF_CNPJ').prop('disabled', estado);
    $('#txANTT').prop('disabled', estado);
    $('#txWebsite').prop('disabled', estado);
}

$('#btnConfirmarSenha').click(function ()
{
    var nome = $('#txNome').val();
    var email = $('#txEmail').val();
    var senha = $('#txSenha').val();
    var telefone1 = $('#txTelefone1').val();
    var telefone2 = $('#txTelefone2').val();
    var cpf_cnpj = $('#txCPF_CNPJ').val();
    var antt = $('#txANTT').val();
    var website = $('#txWebsite').val();

    var senhaDigitada = $('#txSenhaDigitada').val();

    if (senha === senhaDigitada)
    {
        $.ajax({
            url: "/mmnfretes/alteraInfoTransportadora?usuarios.nome=" + nome +
                    "&usuarios.email=" + email +
                    "&usuarios.senha=" + senha +
                    "&usuarios.telefone1=" + telefone1 +
                    "&usuarios.telefone2=" + telefone2 +
                    "&CPF_CNPJ=" + cpf_cnpj +
                    "&ANTT=" + antt +
                    "&website=" + website,
            success: function (data)
            {
                hab_desab_formInfo(true);
                carregaInfoTransportador();

                $('#btnSalvar-info').hide();
                $('#btnEditarInfo').fadeIn(200);
            }
        });
    } else
    {
        $('#senhaIncorreta').modal('toggle');
        $('#senhaIncorreta').modal('show');
    }
});

$('#btnSenhaIncorreta').click(function ()
{
    hab_desab_formInfo(false);
    $('#btnSalvar-info').fadeIn(200);
    $('#alterarSenha').modal('toggle');
    $('#alterarSenha').modal('show');
});

$('#Cartao').change(function ()
{
    $.ajax
            ({
                url: "/mmnfretes/alteraStatusCartao?status=" + $('#Cartao').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});

$('#Boleto').change(function ()
{
    $.ajax
            ({
                url: "/mmnfretes/alteraStatusBoleto?status=" + $('#Boleto').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});

$('#NegociacaoDireta').change(function ()
{
    $.ajax
            ({
                url: "/mmnfretes/alteraStatusNegociacao?status=" + $('#NegociacaoDireta').is(':checked'),
                success: function ()
                {
                    carregaInfoTransportador();
                }
            });
});


