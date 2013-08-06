$(document).ready ->
  $(".slider_banner h2 i p").addClass "default_slider"
  $(".slider_banner h2 i p span").each ->
    $(this).parent().removeClass("default_slider")
                    .addClass "aux_slider"
    $(this).addClass "default_slider"
