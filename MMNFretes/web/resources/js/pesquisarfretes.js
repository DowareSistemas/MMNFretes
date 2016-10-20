$('#btnBuscarFretes').click(function ()
{
    var directionsService = new google.maps.DirectionsService();

    var request =
            {
                origin: $('#txCep_origem').val(),
                destination : $('#txCep_destino').val(),
                travelMode : google.maps.DirectionsTravelMode.DRIVING

            };
            
            directionsService.route(request, function (response, status)
            {
               if(status == google.maps.DirectionsStatus.OK)
               {
                   alert(response.routes[0].legs[0].distance.text);
                   window.location = "/mmnfretes/pesquisar";
               }
               else
               {
                   
               }
            });

});

function decode(data)
{
    alert(data);
}