#coding: utf-8

FactoryGirl.define do
  factory :zone do
    sequence(:name){ |n| "Зона #{n}-#{Time.now.to_i}" }
    provider :bcs
    tariffs{[
      FactoryGirl.build(:tariff, weight_start: 0, weight_end: 0.5),
      FactoryGirl.build(:tariff, weight_start: 0.5, weight_end: 1),
      FactoryGirl.build(:tariff, weight_start: 1, weight_end: 2)
    ]}

    factory :major_express_zone do
      provider :major_express
    end

    factory :bcs_zone do
      provider :bcs
    end
  end
end