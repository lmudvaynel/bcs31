Invoice.reset_column_information
Invoice.status.values.each do |status|
  Invoice.recipient_role.values.each do |recipient_role|
    FactoryGirl.create :invoice, status: status, recipient_role: recipient_role
  end
end
