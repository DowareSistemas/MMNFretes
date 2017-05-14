/* global callback, AMBIENTE_ATUAL */

var id = 0;

$(document).ready(function ()
{
    listarVeiculos();
    $('#btnExcluir-veiculo').hide();

    document.getElementById('fake-file-button-browse-veiculos').addEventListener('click', function ()
    {
        document.getElementById('upload').click();
    });

    document.getElementById('upload').addEventListener('change', function ()
    {
        document.getElementById('fake-file-input-name-veiculos').value = this.value;
        document.getElementById('upload').removeAttribute('disabled');

        var input = this;

        if (input.files && input.files[0])
        {
            var reader = new FileReader();

            reader.onload = function (e)
            {
                $('#img-preview').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    });
});

$('#btnAdicionar-veiculo').click(function ()
{
    if (id > 0)
        alteraVeiculo();
    else
        adicionaVeiculo();
});

function listarVeiculos()
{
    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/listarveiculos",
        success: function (data)
        {
            $('#tabela-veiculos').html("");
            $('#tabela-veiculos').append(data);
            $('#btnAdicionar-veiculo').text('Adicionar');
            $('#formulario-info-veiculo').attr('action', '/' + AMBIENTE_ATUAL + '/salvaveiculo');
            limparCampos();
        }
    });
}

$('#btnExcluir-veiculo').click(function ()
{
    showMsgSimNao("Confirmar exclusão do veículo?");
});

$('#msg-sn-btnSIM').click(function ()
{
    var veiculo_id = id;
    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/excluirveiculo?id=" + veiculo_id,
        dataType: 'text',
        accepts: 'text',
        success: function (result)
        {
            if (result === '0')
            {
                $('#valid-exclusa').modal('toggle');
                $('#valid-exclusao').modal('show');
            } else
            {
                listarVeiculos();
                limparCampos();
            }
        }
    });
});

$('#btBuscar-veiculo').click(function ()
{
    buscarVeiculo();
});

$('#txBusca-veiculo').keypress(function (e)
{
    if (e.which == 13)
    {
        buscarVeiculo();
    }
});

var imgVeiculo;

function carregarVeiculo(id_veiculo, btn)
{
    $(btn).text('Solicitando dados');

    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/infoveiculo?id=" + id_veiculo,
        dataType: 'json',
        accepts: 'json',
        success: function (veiculo)
        {
            $('html, body').animate({scrollTop: '0px'}, 300);
            id = veiculo.id;
            $('#formulario-info-veiculo').attr('action', '/' + AMBIENTE_ATUAL + '/alteraveiculo');
            $('#txID').val(id);
            $('#txDescricao_veiculo').val(veiculo.descricao);
            $('#txCapacidade_veiculo').val(veiculo.capacidade);
            $('#cbCategoria_veiculo').val(veiculo.categorias_veiculos_id);
            $('#cbTipo_carga').val(veiculo.tipos_carga_id);
            $('#txPreco_frete_veiculo').val(veiculo.preco_frete);
            $('#cb_carroceria').val(veiculo.carrocerias_id);
            $('#btnExcluir-veiculo').fadeIn(200);
            $('#ckRastreador').prop('checked', veiculo.rastreador);
            $('#btnAdicionar-veiculo').text('Salvar');
            getImgVeiculo(id_veiculo);
            checkStatusRastreador();

            $(btn).text('Editar ');
        }
    });
}

$('#ckRastreador').change(function ()
{
    checkStatusRastreador();
});

function checkStatusRastreador()
{
    if ($('#ckRastreador').prop('checked') === true)
        $('#descricaoRastreador').val('Sim');
    else
        $('#descricaoRastreador').val('Não');
}

function getImgVeiculo(id_veiculo)
{
    var url = "/" + AMBIENTE_ATUAL + "/veiculo_path";
    var prm = {veiculo_id: id_veiculo};

    $.post(url, prm, function (data)
    {
        $('#img-preview').attr('src', data);
    });
}

function buscarVeiculo()
{
    var nomeVeiculo = $('#txBusca-veiculo').val();
    $.ajax({
        url: "/" + AMBIENTE_ATUAL + "/buscarveiculos?nome=" + nomeVeiculo,
        success: function (data)
        {
            $('#tabela-veiculos').html("");
            $('#tabela-veiculos').append(data);
        }
    });
}

function uploadImagem()
{
    if ($('#fake-file-input-name-veiculos').val() === '')
    {
        $('#img-preview').attr('src', 'resources/img/checked_truck-512.png');
        return;
    }

    $('#form-img').ajaxForm({
        success: function (data)
        {
            $('#img-preview').attr('src', 'resources/img/checked_truck-512.png');
            $('#upload').val(null);
        }
    }).submit();
}

function alteraVeiculo()
{
    var str = $('#txPreco_frete_veiculo').val();
    str = str.replace(".", "");
    str = str.replace(",", ".");
    $('#txPreco_frete_veiculo').val(parseFloat(str).toFixed(2));

    if (validaCampos() === false)
    {
        $('#valid-campos').modal('toggle');
        $('#valid-campos').modal('show');

        return;
    }

    $('#formulario-info-veiculo').ajaxForm({
        success: function (data)
        {
            $('#form-img').attr('action', '/' + AMBIENTE_ATUAL + '/uploadimg?veiculo_id=' + id);
            uploadImagem();
            listarVeiculos();
        }
    }).submit();
}

function validaCampos()
{
    var descricao = $('#txDescricao_veiculo').val();
    var capacidade = $('#txCapacidade_veiculo').val();
    var preco_frete = $('#txPreco_frete_veiculo').val();
    var rastreador = $('#ckRastreador').is(':checked');
    var categoria = $('#cbCategoria_veiculo').val();
    var tipo_carga = $('#cbTipo_carga').val();
    var carroceria = $('#cb_carroceria').val();

    if (descricao === '')
        return false;
    if (capacidade === '0' || capacidade === 0 || capacidade === '')
        return false;
    if (categoria === 0 || categoria === 0 || capacidade === '')
        return  false;
    if (tipo_carga === 0 || tipo_carga === '0' || tipo_carga === '')
        return false;
    if (carroceria === 0 || carroceria === '0' || carroceria === '')
        return false;

    return true;
}

function limparCampos()
{
    id = 0;
    $('#txID').val(0);
    $('#btnExcluir-veiculo').fadeOut(200);
    $('#txDescricao_veiculo').val('');
    $('#txCapacidade_veiculo').val('');
    $('#txPreco_frete_veiculo').val('');
    $('#cbCategoria_veiculo').val(1);
    $('#cbTipo_carga').val(1);
    $('#cb_carroceria').val(1);
    $('#txPlaca_veiculo').val('');
    $('#fake-file-input-name-veiculos').val('');
    $('#formulario-info-veiculo').attr('action', '/' + AMBIENTE_ATUAL + '/salvaveiculo');
}

function adicionaVeiculo()
{
    var str = $('#txPreco_frete_veiculo').val();
    str = str.replace(".", "");
    str = str.replace(",", ".");
    $('#txPreco_frete_veiculo').val(parseFloat(str).toFixed(2));

    if (validaCampos() === false)
    {
        $('#valid-campos').modal('toggle');
        $('#valid-campos').modal('show');
        return;
    }
    $('#txID').val('0');
    $('#formulario-info-veiculo').ajaxForm({
        success: function (data)
        {
            $('#form-img').attr('action', '/' + AMBIENTE_ATUAL + '/uploadimg?veiculo_id=' + id);
            uploadImagem();
            listarVeiculos();
        }
    }).submit();
}