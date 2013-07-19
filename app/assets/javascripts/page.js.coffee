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
    $("#new_review_form_wrapper").toggleClass("hidden")
