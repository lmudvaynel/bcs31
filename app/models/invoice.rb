class Invoice < ActiveRecord::Base
  attr_accessible :arrival_to, :first_name, :last_name, :middle_name, :number, :send_from, :status
end
