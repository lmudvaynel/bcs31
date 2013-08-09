FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    central false
    district_level false

    factory :central_city do
      central true
    end

    factory :district_level_city do
      district_level true
    end
  end
end