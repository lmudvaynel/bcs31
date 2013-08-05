isEmail = (email) ->
  email = $.trim(email)
  regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
  regex.test email

jQuery ->
  $('form#new_feedback').on 'ajax:beforeSend', ->
    unless isEmail($('#feedback_email').val())
      noty
        text: 'Введите правильный e-mail'
        type: 'error'
      return false
  $('form#new_feedback').on 'ajax:success', ->
    noty text: 'Ваше сообщение успешно отправлено'
  $('form#new_feedback').on 'ajax:error', ->
    noty
      text: 'Произошла ошибка'
      type: 'error'
