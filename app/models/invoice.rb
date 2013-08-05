class Invoice < ActiveRecord::Base
  extend Enumerize
  extend ActiveModel::Naming
  attr_accessible :status, :number, :send_from, :arrival_to,
                  :recipient_surname, :recipient_role, :delivered_at
  enumerize :status,  in: [ :cargo_taken_back, :cargo_manifested, :cargo_sent,
                            :cargo_arrived, :cargo_is_received, :delivery_accepted,
                            :submitted_to_courier, :cargo_is_delivered ],
                      default: :cargo_taken_back
  enumerize :recipient_role,  in: [ :reception, :employee, :expedition,
                                    :personally, :guard, :kinsman ],
                              default: :personally
  NUMBER_OF_DIGITS = 8

  before_validation :set_date_of_delivery

  validates :number,  presence: true,
                      uniqueness: true,
                      inclusion: { in: 10**(NUMBER_OF_DIGITS - 1)..(10**NUMBER_OF_DIGITS - 1) }
  validates :status, :send_from, :arrival_to, :recipient_surname, :recipient_role, presence: true

  private

  def set_date_of_delivery
    update_attribute :delivered_at, DateTime.now if status && status.cargo_is_delivered?
  end
end
