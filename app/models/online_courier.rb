#encoding: utf-8
class OnlineCourier < ActiveRecord::Base
  extend Enumerize
  attr_accessible :address, :amount, :cargo_type, :city, :comment, :company, :date, :full_name,
                  :payer, :payer_number, :payment, :phone, :size, :time_start, :time_end, :transportation, :weight

  validates :address, :amount, :cargo_type, :city, :date, :full_name, presence: true
  validates :payer, :payment, :phone, :transportation, :weight, presence: true

  validates :time_start, presence: true, length: { maximum: 5 }
  validates_length_of :time_end, maximum: 5, :allow_blank => true

  enumerize :transportation, in: ["наличный расчет", "экспресс-доставка"]
  enumerize :payment, in: ["наличный расчет","безналичный расчет"]
  enumerize :payer, in: ["отправитель","получатель","третья сторона"]
end