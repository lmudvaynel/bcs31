FactoryGirl.define do
  factory :invoice do
    sequence(:number){|n| (n.to_s + rand(10**6..10**7 - 1).to_s).first(8).to_i }
    status "MyString"
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    send_from "MyString"
    arrival_to "MyString"
  end
end
