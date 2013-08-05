# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    number 1
    status "MyString"
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    send_from "MyString"
    arrival_to "MyString"
  end
end
