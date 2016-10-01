var id = 0;

$(document).ready(function ()
{

});

$('#btnAdicionar-veiculo').click(function ()
{
    adicionaVeiculo();
});


function adicionaVeiculo()
{
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
            alert(data);
        }
    });
}