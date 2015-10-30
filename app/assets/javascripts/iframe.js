$(window).load(function() {
    var v_port;
//    alert('ready');
     //////////////////  callus ifra,e
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
        console.log("hit");
        $('.indexes_iframe_container').css({'display': 'block'});
        $('#indexes_iframe').css({'display': 'block'});
//        $('#indexes_iframe').css("display" , "block");
        $('.closing_cross').css("display" , "block");
        $('.indexes_wrapper').css("display" , "block");
//        console.log(v_port);
    });
    $('.closing_cross.indexes').on('click', function(evt){
        evt.preventDefault();
        $('#indexes_iframe').css("display" , "none");
        $('.closing_cross').css("display" , "none");
        $('.indexes_iframe_container').css("display" , "none");
    });
    ////////////////// tracking iframe
    $("a.service_link.tracking").on('click', function(){
        v_port = $(window).height();
        console.log("hit");
        $('.tracking_iframe_container').css({'height': v_port / 2, 'display': 'block'});
        $('#tracking_iframe').css({'height': v_port / 1.2, 'display': 'block'});
//        $('#indexes_iframe').css("display" , "block");
        $('.closing_cross-t').css("display" , "block");
    });
    $('.closing_cross-t.tracking').on('click', function(evt){
        evt.preventDefault();
        $('#tracking_iframe').css("display" , "none");
        $('.closing_cross-t').css("display" , "none");
        $('.tracking_iframe_container').css("display" , "none");
    });



});
