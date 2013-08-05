# encoding: utf-8
ActiveAdmin.register Invoice do
  config.batch_actions = false

  index do
    column :status
    column :number
    column :recipient_surname
    column :recipient_role
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :status,
              as: :select,
              collection: Hash[Invoice.status.values.map{|s|[s.capitalize, s]}],
              input_html: { class: 'status_of_invoice' }
      f.input :number
      f.input :send_from
      f.input :arrival_to
      f.input :recipient_surname
      f.input :recipient_role,
              as: :select,
              collection: Hash[Invoice.recipient_role.values.map{|r|[r.capitalize, r]}]
      f.input :delivered_at, as: :datepicker, input_html: { class: 'date_of_invoice_delivery' }
    end
    f.actions
  end
end
