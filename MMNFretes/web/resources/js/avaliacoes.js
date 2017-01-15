var estrelas = 1;

$('#str-1').mouseover(function ()
{
    $('#str-2').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-3').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-4').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-5').attr('class', 'glyphicon glyphicon-star-empty');
    
    estrelas = 1;
});

$('#str-2').mouseover(function ()
{
    $('#str-1').attr('class', 'glyphicon glyphicon-star');
    $('#str-2').attr('class', 'glyphicon glyphicon-star');

    $('#str-3').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-4').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-5').attr('class', 'glyphicon glyphicon-star-empty');
    
    estrelas = 2;
});

$('#str-3').mouseover(function ()
{
    $('#str-1').attr('class', 'glyphicon glyphicon-star');
    $('#str-2').attr('class', 'glyphicon glyphicon-star');
    $('#str-3').attr('class', 'glyphicon glyphicon-star');

    $('#str-4').attr('class', 'glyphicon glyphicon-star-empty');
    $('#str-5').attr('class', 'glyphicon glyphicon-star-empty');
    
    estrelas = 3;
});

$('#str-4').mouseover(function ()
{
    $('#str-1').attr('class', 'glyphicon glyphicon-star');
    $('#str-2').attr('class', 'glyphicon glyphicon-star');
    $('#str-3').attr('class', 'glyphicon glyphicon-star');
    $('#str-4').attr('class', 'glyphicon glyphicon-star');

    $('#str-5').attr('class', 'glyphicon glyphicon-star-empty');
    
    estrelas = 4;
});

$('#str-5').mouseover(function ()
{
    $('#str-1').attr('class', 'glyphicon glyphicon-star');
    $('#str-2').attr('class', 'glyphicon glyphicon-star');
    $('#str-3').attr('class', 'glyphicon glyphicon-star');
    $('#str-4').attr('class', 'glyphicon glyphicon-star');
    $('#str-5').attr('class', 'glyphicon glyphicon-star');
    
    estrelas = 5;
});