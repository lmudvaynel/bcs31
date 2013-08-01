module FormHelper
  def online_courier_text_field(field, form)
    <<-HTML
      <div class="field">
        #{form.label(field, class: 'request_lable')}
        #{form.text_field(field, class: 'input-block-level')}
      </div>
    HTML
  end
end