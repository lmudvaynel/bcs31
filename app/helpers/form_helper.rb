module FormHelper
  def online_courier_text_field(field, form)
    raw <<-HTML
      <div class="courier_field_container">
        #{form.label(field, class: 'field_name')}
        #{form.text_field(field, class: 'text_field')}
      </div>
    HTML
  end
end