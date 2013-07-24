class OnlineCourier < ActiveRecord::Base
  attr_accessible :address, :amount, :cargo_type, :city, :comment, :company, :date, :full_name,
                  :payer, :payer_id, :payment, :phone, :size, :time, :transportation, :weight

  validates :address, :amount, :cargo_type, :city, :date, :full_name, presence: true
  validates :payer, :payment, :phone, :time, :type, :weight, presence: true
end
