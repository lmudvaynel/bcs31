# encoding: utf-8
ActiveAdmin.register OnlineCourier do
  menu parent: 'Обратная связь'
  index do
    column :transportation, :as => :select, :collection => ["наличный расчет", "экспресс-доставка"]
    column :date, as: :date_select,
            start_year: Time.now.year, end_year: Time.now.year + 10
    column :time_start
    column :time_end
    column :full_name
    column :phone
    column :company
    column :address
    column :weight
    column :amount
    column :size
    column :cargo_type
    column :city
    column :payment, :as => :select, :collection => ["наличный расчет", "безналичный расчет"]
    column :payer, :as => :select, :collection => ["отправитель", "получатель", "третья сторона"]
    column :payer_number
    column :comment
    default_actions
  end

   form partial: 'form'

end