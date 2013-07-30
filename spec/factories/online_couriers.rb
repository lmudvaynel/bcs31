#encoding: utf-8
FactoryGirl.define do
  factory :online_courier do
    transportation "kjkjj"
    time { '4' }
    date {DateTime.now + 1}

# Как проверять разные случаи: прошедшая дата, без компании и тд ?

    factory :date do
      date { DateTime.now }
    end

    factory :old_date do
      date { DateTime.now - 10 }
    end

    factory :without_company do
      company { nil }
    end

    factory :pay_by_cash do
      payment {"наличный расчет"}
    end

    factory :cashless do
      payment {"безналичный расчет"}
    end

    full_name { Faker::Name.first_name + Faker::Name.last_name}
    phone     { Faker::PhoneNumber.phone_number }
    company "MyString"
    address { Faker::Address.street_address }
    weight { Random.rand(10..1000) }
    amount { Random.rand(1..500)}
    #Как задать габариты?
    size   {Faker::Lorem.sentence}
    cargo_type { Faker::Lorem.word }
    city { Faker::Address.city }

    #Выбрать из списка
    payment "наличный расчет", "безналичный расчет"
    payer  "отправитель", "получатель", "третья сторона"
    #Странный id
    payer_id {}
    comment { Faker::Lorem.sentence }
  end
end