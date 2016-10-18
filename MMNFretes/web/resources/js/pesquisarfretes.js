$('#btnBuscarFretes').click(function ()
{
    var urlGoogle = "http://maps.googleapis.com/maps/api/distancematrix/json?origins={0}&destinations={1}&mode=driving&language=pt-BR&sensor=false";
    urlGoogle = urlGoogle.replace("{0}", $('#txCep_origem').val());
    urlGoogle = urlGoogle.replace("{1}", $('#txCep_destino').val());

    var response = null;
    $.ajax({
        url: urlGoogle,
        dataType: 'jsonp',
        accepts: 'json',
        success: function (data) {
            alert(data);
        }
    });

});

function decode(data)
{
    alert(data);
}