#coding: utf-8

FactoryGirl.define do
  factory :region do
    sequence(:name){|n| "Область №#{n}-#{Time.now.to_i}"}
    main_city { FactoryGirl.build(:city) }
  end
end
