FactoryGirl.define do
  factory :delivery_city_relation do
    city_from { FactoryGirl.build(:city) }
    city_to { FactoryGirl.build(:city) }
    zones { [FactoryGirl.build(:bcs_zone), FactoryGirl.build(:major_express_zone)] }
    delivery_time { "#{rand(1..3)}-#{rand(4..10)}" }
    business_morning false
  end
end
