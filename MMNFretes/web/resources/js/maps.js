/* global google */

var geocoder;
var map;
var marker;
var latlng;
var cep_atual = "";

function initialize()
{
    latlng = new google.maps.LatLng(-18.8800397, -47.05878999999999);
    var options = {
        zoom: 5,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("mapa"), options);
    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map: map,
        draggable: true
    });

    marker.setPosition(latlng);
    google.maps.event.trigger(map, "resize");

    google.maps.event.addListener(map, 'click', function (event)
    {
        geocoder.geocode({
            'latLng': event.latLng
        }, function (results, status)
        {
            if (status === google.maps.GeocoderStatus.OK)
            {
                if (results[0])
                {
                    $('#lbDescricao-endereco').hide();
                    $("#lbDescricao-endereco").text(results[0].formatted_address);
                    cep_atual = results[7].address_components[0].short_name;
                    $('#lbDescricao-endereco').fadeIn(500);
                }
            }
        });
    });
}

$('#pesquisa-mapa').on("shown.bs.modal", function ()
{
    google.maps.event.trigger(map, "resize");
    map.setCenter(latlng);
});

$(document).ready(function ()
{
    initialize();
    $('#lbDescricao-endereco').hide();

    $("#btnEndereco").click(function ()
    {
        if ($(this).val() !== "")
            carregarNoMapa($("#txtEndereco").val());
    });

    $("#txtEndereco").blur(function ()
    {
        if ($(this).val() !== "")
            carregarNoMapa($(this).val());
    });
});

function carregarNoMapa(endereco)
{
    $('#lbDescricao-endereco').fadeOut(400);
    geocoder.geocode({'address': endereco + ', Brasil', 'region': 'BR'}, function (results, status)
    {
        if (status === google.maps.GeocoderStatus.OK)
        {
            if (results[0])
            {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();

                $('#txtEndereco').val(results[0].formatted_address);
                $('#txtLatitude').val(latitude);
                $('#txtLongitude').val(longitude);

                var location = new google.maps.LatLng(latitude, longitude);
                marker.setPosition(location);
                map.setCenter(location);
                map.setZoom(16);
            }
        }
    });
}