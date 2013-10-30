$(document).ready ->
  $(".btop-third-link").height $("#btop-container").height() - 5

  $(".menu_item").bind 'mouseenter', (event) ->
	  if !$(this).hasClass 'current'
		  $links = $(this).find '.nested_links'
		  $links.removeClass 'hidden'

  $(".menu_item").bind 'mouseleave', (event) ->
    $links = $(this).find('.nested_links')
    $links.addClass('hidden')

  $("#show_new_review_form").bind "click", (event) ->
    event.preventDefault()
    if !$("#new_review_form_wrapper").is(":visible")
      $("#new_review_form_wrapper").slideDown 300
      $(".review_buffer").slideUp 200
    else
      $("#new_review_form_wrapper").slideUp 300
      $(".review_buffer").slideDown 200

  if !$("#new_review_form_wrapper .field_with_errors").length > 0 and !$("#new_review_form_wrapper .form_error").length > 0
    $("#new_review_form_wrapper").hide()
#
  $(".dropdown-toggle").bind 'mouseenter', (event) ->
    $(this).next().css "display", "block"

  $("ul.nav.top-2>li").bind 'mouseleave', (event) ->
    $(this).children('ul').css "display", "none"


  $("form").submit ->
    if $("#delivery_weight").val().length is 0
      alert "Введите вес посылки"
      return false
    return