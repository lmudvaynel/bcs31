# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    first_name "MyString"
    last_name "MyString"
    company_name "MyString"
    logo "MyString"
    city "MyString"
    content "MyText"
    moderated false
  end
end
