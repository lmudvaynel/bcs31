$(window).load(function() {
    var v_port;
     //////////////////
    $(".button_call_us.redish, .call_us_span").on('click', function(){
        $('.iframe_container_callus').css("display" , "block");
        $('.callus_iframe').css("display" , "block");
        $('.closing_cross').css("display" , "block");
    });
    $('.closing_cross').on('click', function(evt){
        evt.preventDefault();
        $('.callus_iframe').css("display" , "none");
        $('.closing_cross').css("display" , "none");
        $('.iframe_container_callus').css("display" , "none");
    });
     ////////////////// indexes iframe
    $("a.service_link.indexes").on('click', function(){
        v_port = $(window).height();
        $('.indexes_iframe_container').css({'height': v_port + "px", 'display': 'block'});
        $('.indexes_iframe').css("display" , "block");
        $('.closing_cross').css("display" , "block");
        console.log(v_port);
    });
    $('.closing_cross').on('click', function(evt){
        evt.preventDefault();
        $('.indexes_iframe').css("display" , "none");
        $('.closing_cross').css("display" , "none");
        $('.indexes_iframe_container').css("display" , "none");
    });

});