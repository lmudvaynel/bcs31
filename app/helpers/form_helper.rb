module FormHelper
  def online_courier_text_field(field, form)
    raw <<-HTML
      <div class="courier_field_container">
        #{form.label(field, class: 'field_name courier')}
        #{form.text_field(field, class: 'text_field courier')}
      </div>
    HTML
  end
end