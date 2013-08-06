# encoding: utf-8
ActiveAdmin.register Invoice do
  menu priority: 3
  config.batch_actions = false

  index do
    column :status do |invoice|
      invoice.status.text
    end
    column :number
    column :recipient_surname
    column :recipient_role do |invoice|
      invoice.recipient_role.text
    end
    column :created_at
    default_actions
  end

  show do |invoice|
    attributes_table do
      row :id
      row :status do
        invoice.status.text
      end
      row :number
      row :send_from
      row :arrival_to
      row :recipient_surname
      row :recipient_role do
        invoice.recipient_role.text
      end
      row :delivered_at
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :status,
              as: :select,
              collection: Hash[Invoice.status.values.map{|s|[s.text, s]}],
              input_html: { class: 'status_of_invoice' }
      f.input :number
      f.input :send_from
      f.input :arrival_to
      f.input :recipient_surname
      f.input :recipient_role,
              as: :select,
              collection: Hash[Invoice.recipient_role.values.map{|r|[r.text, r]}]
      f.input :delivered_at, as: :datepicker, input_html: { class: 'date_of_invoice_delivery' }
    end
    f.actions
  end
end
