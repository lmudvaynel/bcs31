#= require active_admin/base
#= require activeadmin-sortable

jQuery ->
  customTabs $('.globalize-content')
  customTabs $('.globalize-seo')
  customTabs $('.globalize-project')
  setup_invoice_form()

customTabs = (parent) ->
  parent.find('.language-selection li:first').addClass('lang-switch-active')
  parent.find('> div > div:first').show()

  parent.find('.language-selection li a').on 'click', ->
    $(this).parent().addClass('lang-switch-active').siblings().removeClass('lang-switch-active')
    parent.find('> div > div').hide().eq($(this).parent().index()).show()
    return false

show_invoice_delivered_at = () ->
  $("#invoice_delivered_at_input").show()

hide_invoice_delivered_at = () ->
  $("#invoice_delivered_at_input").hide()
  $('#invoice_delivered_at').val(null)

setup_invoice_form = () ->
  hide_invoice_delivered_at() unless $('.status_of_invoice').val() == "cargo_is_delivered"
  $('.status_of_invoice').on 'change', select_invoice_status

select_invoice_status = () ->
  if $(@).val() == "cargo_is_delivered"
    show_invoice_delivered_at()
  else
    hide_invoice_delivered_at()
