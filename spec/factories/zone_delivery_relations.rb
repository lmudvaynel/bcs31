# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zone_delivery_relation do
    zone{ FactoryGirl.build(:zone)}
    delivery_city_relation{ FactoryGirl.build(:delivery_city_relation)}
  end
end
