class Invoice < ActiveRecord::Base
  attr_accessible :status, :number, :send_from, :arrival_to,
                  :recipient_surname, :recipient_role, :delivered_at
  NUMBER_OF_DIGITS = 8
end
