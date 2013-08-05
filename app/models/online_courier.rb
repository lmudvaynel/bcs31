#encoding: utf-8
class OnlineCourier < ActiveRecord::Base
  attr_accessible :address, :amount, :cargo_type, :city, :comment, :company, :date, :full_name,
                  :payer, :payer_number, :payment, :phone, :size, :time_start, :time_end, :transportation, :weight

  validates :address, :amount, :cargo_type, :city, :date, :full_name, presence: true
  validates :payer, :payment, :phone, :transportation, :weight, presence: true

  validates :time_start, :time_end, presence: true, length: { maximum: 5 }

  validate :right_dates

  def right_dates
    if date < DateTime.now
      errors[:date] << 'Не может быть прошедшей датой'
    end
  end

  def right_time_interval
    if time_end.to_i - time_start.to_i < 3
      errors[:time_end] << "Временной интервал должен быть не менее 3 часов"
    end
  end
end