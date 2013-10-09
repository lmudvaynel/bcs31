$(window).load(function() {

    $(".button_call_us.reddish").on('click', function(){
        $('.iframe_container').css("display" , "block");
        $('.callus_iframe').css("display" , "block");
        $('.closing_cross').css("display" , "block");
    });
    $('.closing_cross').on('click', function(evt){
        evt.preventDefault();
        $('.callus_iframe').css("display" , "none");
        $('.closing_cross').css("display" , "none");
        $('.iframe_container').css("display" , "none")
    });
});