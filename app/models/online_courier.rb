#encoding: utf-8

class OnlineCourier < ActiveRecord::Base
  attr_accessible :address, :amount, :cargo_type, :city, :comment, :company, :date, :full_name,
                  :payer, :payer_id, :payment, :phone, :size, :time, :transportation, :weight

  validates :address, :amount, :cargo_type, :city, :date, :full_name, presence: true
  validates :payer, :payment, :phone, :time, :transportation, :weight, presence: true

  validate :right_dates


  def right_dates
    if date.end_of_day <= Time.now
      errors[:date] << 'Не может быть прошедшей датой'
    end
  end
end