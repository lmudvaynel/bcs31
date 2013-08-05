FactoryGirl.define do
  factory :invoice do
    sequence(:number) do |n|
      digits = Invoice::NUMBER_OF_DIGITS
      random_part_of_number = rand(10**(digits - 2)..10**(digits - 1) - 1).to_s
      (n.to_s + random_part_of_number).first(digits).to_i
    end
    status ""
    send_from ""
    arrival_to ""
    recipient_surname ""
    recipient_role ""
    delivered_at ""
  end
end
