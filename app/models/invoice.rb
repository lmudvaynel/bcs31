class Invoice < ActiveRecord::Base
  extend Enumerize
  attr_accessible :status, :number, :send_from, :arrival_to,
                  :recipient_surname, :recipient_role, :delivered_at
  enumerize :status,  in: [ :cargo_taken_back, :cargo_manifested, :cargo_sent,
                            :cargo_arrived, :cargo_is_received, :delivery_accepted,
                            :submitted_to_courier, :cargo_is_delivered ],
                      default: :cargo_taken_back
  enumerize :recipient_role,  in: [ :reception, :employee, :expedition,
                                    :personally, :guard, :kinsman],
                              default: :personally
  NUMBER_OF_DIGITS = 8
end
