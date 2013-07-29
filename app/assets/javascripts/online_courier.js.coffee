$(document).ready ->
  $('form#new_online_courier').on 'ajax:success', ->
    noty
      text: I18n.t('js.online_courier.send_success')
  $('form#new_online_courier').on 'ajax:error', (event, xhr, status, error) ->
    noty
      text: I18n.t('js.send_error')
      type: 'error'