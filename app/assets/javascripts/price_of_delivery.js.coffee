$(document).ready ->
  $("#delivery_price_form").on "ajax:success", (e, data, status, xhr) ->
    $('.delivery_price_container').html $.app.render('delivery_price', data)