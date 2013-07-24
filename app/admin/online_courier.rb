# Encoding: utf-8
ActiveAdmin.register OnlineCourier do

  form do |f|
    f.inputs do
      f.input :transportation, :as => :select, :collection => ["наличный расчет", "экспресс-доставка"]
      f.input :date, as: :date_select,
                     start_year: Time.now.year, end_year: Time.now.year + 10
      f.input :time
      f.input :full_name
      f.input :phone
      f.input :company
      f.input :address
      f.input :weight
      f.input :amount
      f.input :size
      f.input :cargo_type
      f.input :city
      f.input :payment, :as => :select, :collection => ["наличный расчет", "безналичный расчет"]
      f.input :payer, :as => :select, :collection => ["отправитель", "получатель", "третья сторона"]
      f.input :payer_id
      f.input :comment
    end

    f.actions
  end

end
