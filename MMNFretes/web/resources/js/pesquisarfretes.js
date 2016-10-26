$(document).ready(function ()
{
    
})

$('#btnBuscarFretes').click(function ()
{
    var directionsService = new google.maps.DirectionsService();

    var request =
            {
                origin: $('#txCep_origem').val(),
                destination: $('#txCep_destino').val(),
                travelMode: google.maps.DirectionsTravelMode.DRIVING

            };

    directionsService.route(request,function (response,status)
    {
        if (status == google.maps.DirectionsStatus.OK)
        {
            var distancia = response.routes[0].legs[0].distance.text;
            var url = getURL(distancia);
            window.location = url;
        }
    });
});

function getURL(distancia)
{
    distancia = distancia.replace(" km","");
    distancia = distancia.replace(",",".");
    
    var filtro_carrocerias = getFiltroCarrocerias();
    var filtro_categorias = getFiltroCategorias();
    var rastreador = $('#rdoSIM').is(':checked');

    var url = "/mmnfretes/pesquisafrete?categorias={0}&carrocerias={1}&rastreador={2}&distancia={3}";
    url = url.replace("{0}",filtro_categorias);
    url = url.replace("{1}",filtro_carrocerias);
    url = url.replace("{2}",rastreador);
    url = url.replace("{3}",distancia);

    return url;
}

function getFiltroCarrocerias()
{
    var retorno = "";
    /*
     *   CARROCERIAS VEICULOS
     */
    var bau = $('#ckBau').is(':checked');
    var sider = $('#ckSider').is(':checked');
    var cacamba = $('#ckCacamba').is(':checked');
    var gradeBaixa = $('#ckGradeBaixa').is(':checked');

    if (bau)
        retorno += "1,";
    if (sider)
        retorno += "2,";
    if (cacamba)
        retorno += "3,";
    if (gradeBaixa)
        retorno += "4";

    return retorno;
}

function getFiltroCategorias()
{
    var retorno = "";

    //capturando os estados dos Checkbox's e RadioButtons da tela
    /*
     *    CATEGORIAS VEICULOS
     */
    var rodotrem = $('#ckRodotrem').is(':checked');
    var bitrem = $('#ckBitrem').is(':checked');
    var carretaLS = $('#ckCarrega_LS').is(':checked');
    var carreta = $('#ckCarreta').is(':checked');
    var bitruck = $('#ckBitruck').is(':checked');
    var truck = $('#ckTruck').is(':checked');
    var toco = $('#ckToco').is(':checked');
    var tres_quatro = $('#ck34').is(':checked');
    var VLC = $('#ckVLC').is(':checked');
    var VUC = $('#ckVUC').is(':checked');

    if (toco)
        retorno += "1,";
    if (tres_quatro)
        retorno += "2,";
    if (VLC)
        retorno += "3,";
    if (VUC)
        retorno += "4,";
    if (truck)
        retorno += "5,";
    if (bitruck)
        retorno += "6,";
    if (rodotrem)
        retorno += "7,";
    if (bitrem)
        retorno += "8,";
    if (carretaLS)
        retorno += "9,";
    if (carreta)
        retorno += "10";

    return retorno;
}