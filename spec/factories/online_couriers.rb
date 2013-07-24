# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :online_courier do
    type ""
    date "2013-07-24"
    time "MyString"
    full_name "MyString"
    phone "MyString"
    company "MyString"
    address "MyString"
    weight "MyString"
    amount "MyString"
    size "MyString"
    cargo_type "MyString"
    city "MyString"
    payment "MyString"
    payer "MyString"
    payer_id "MyString"
    comment "MyString"
  end
end
