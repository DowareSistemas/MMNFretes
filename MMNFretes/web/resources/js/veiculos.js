var id = 0;

$(document).ready(function ()
{
    listarVeiculos();
    $('#btnExcluir-veiculo').hide();
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
        url: "/mmnfretes/listarveiculos",
        success: function (data) {
            $('#tabela-veiculos').html("");
            $('#tabela-veiculos').append(data);
        }
    });
}

$('#btnConf_del_veiculo').click(function ()
{
    var veiculo_id = id;
    $.ajax({
        url: "/mmnfretes/excluirveiculo?id=" + veiculo_id,
        dataType: 'text',
        accepts: 'text',
        success: function (result) {
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

$('#txBusca-veiculo').keypress(function (e) {
    if (e.which == 13) {
        buscarVeiculo();
    }
});

function carregarVeiculo(id_veiculo)
{
    $.ajax({
        url: "/mmnfretes/infoveiculo?id=" + id_veiculo,
        dataType: 'json',
        accepts: 'json',
        success: function (veiculo) {
            id = veiculo.id;
            $('#txDescricao_veiculo').val(veiculo.descricao);
            $('#txCapacidade_veiculo').val(veiculo.capacidade);
            $('#cbCategoria_veiculo').val(veiculo.categorias_veiculos_id);
            $('#cbTipo_carga').val(veiculo.tipos_carga_id);
            $('#txPreco_frete_veiculo').val(veiculo.preco_frete);
            $('#cb_carroceria').val(veiculo.carrocerias_id);
            $('#btnExcluir-veiculo').fadeIn(200);

            $.ajax({
                url: "/mmnfretes/veiculo_path?veiculo_id=" + id_veiculo,
                dataType: 'text',
                accepts: 'text',
                success: function (data) {
                    $('#img-preview').attr('src', data);
                }
            });
        }
    });
}

//$("#upload-file-selector").
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#img-preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#upload").change(function () {
    readURL(this);
});


function buscarVeiculo()
{
    var nomeVeiculo = $('#txBusca-veiculo').val();
    $.ajax({
        url: "/mmnfretes/buscarveiculos?nome=" + nomeVeiculo,
        success: function (data) {
            $('#tabela-veiculos').html("");
            $('#tabela-veiculos').append(data);
        }
    });
}

function uploadImagem()
{
    $('#form-img').ajaxForm({
        success: function (data) {
            $('#img-preview').attr('src', 'resources/img/checked_truck-512.png');
            $('#upload').val(null);
            location.reload();
        }
    }).submit();
}

function alteraVeiculo()
{
    if (validaCampos() === false)
    {
        $('#valid-campos').modal('toggle');
        $('#valid-campos').modal('show');

        return;
    }

    var descricao = $('#txDescricao_veiculo').val();
    var capacidade = $('#txCapacidade_veiculo').val();
    var preco_frete = $('#txPreco_frete_veiculo').val();
    var rastreador = $('#rdo_rastreador_veiculo').is(':checked');
    var categoria = $('#cbCategoria_veiculo').val();
    var tipo_carga = $('#cbTipo_carga').val();
    var carroceria = $('#cb_carroceria').val();

    $.ajax({
        url: "/mmnfretes/alteraveiculo?" +
                "id=" + id +
                "&descricao=" + descricao +
                "&capacidade=" + capacidade +
                "&tipo_carga_id=" + tipo_carga +
                "&preco_frete=" + preco_frete +
                "&rastreador=" + rastreador +
                "&categorias_veiculos_id=" + categoria +
                "&tipos_carga_id=" + tipo_carga +
                "&carrocerias_id=" + carroceria,
        success: function (data)
        {
            $('#form-img').attr('action', '/mmnfretes/uploadimg?veiculo_id=' + id);
            uploadImagem();
            listarVeiculos();
            limparCampos();
        }
    });
}

function validaCampos()
{
    var descricao = $('#txDescricao_veiculo').val();
    var capacidade = $('#txCapacidade_veiculo').val();
    var preco_frete = $('#txPreco_frete_veiculo').val();
    var rastreador = $('#rdo_rastreador_veiculo').is(':checked');
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
    $('#btnExcluir-veiculo').fadeOut(200);
    $('#txDescricao_veiculo').val('');
    $('#txCapacidade_veiculo').val('');
    $('#txPreco_frete_veiculo').val('');
    $('#cbCategoria_veiculo').val(1);
    $('#cbTipo_carga').val(1);
    $('#cb_carroceria').val(1);
}

function adicionaVeiculo()
{
    if (validaCampos() === false)
    {
        $('#valid-campos').modal('toggle');
        $('#valid-campos').modal('show');
        return;
    }

    var descricao = $('#txDescricao_veiculo').val();
    var capacidade = $('#txCapacidade_veiculo').val();
    var preco_frete = $('#txPreco_frete_veiculo').val();
    var rastreador = $('#rdo_rastreador_veiculo').is(':checked');
    var categoria = $('#cbCategoria_veiculo').val();
    var tipo_carga = $('#cbTipo_carga').val();
    var carroceria = $('#cb_carroceria').val();

    $.ajax({
        url: "/mmnfretes/salvaveiculo?" +
                "descricao=" + descricao +
                "&capacidade=" + capacidade +
                "&tipo_carga_id=" + tipo_carga +
                "&preco_frete=" + preco_frete +
                "&rastreador=" + rastreador +
                "&categorias_veiculos_id=" + categoria +
                "&tipos_carga_id=" + tipo_carga +
                "&carrocerias_id=" + carroceria,
        success: function (data)
        {
            $('#form-img').attr('action', '/mmnfretes/uploadimg?veiculo_id=' + id);
            uploadImagem();
            listarVeiculos();
        }
    });
}