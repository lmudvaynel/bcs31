#encoding: utf-8
FactoryGirl.define do
  factory :online_courier do
    transportation { ["наличный расчет", "экспресс-доставка"].sample }
    time           { rand(3..24) }
    date           { DateTime.now }
    full_name      { Faker::Name.name}
    phone          { Faker::PhoneNumber.phone_number }
    company        { Faker::Company.name }
    address        { Faker::Address.street_address }
    weight         { Random.rand(10..1000) }
    amount         { Random.rand(1..500) }
    size           { (1..3).map{rand(1..20)*5}.join('x') }
    cargo_type     { Faker::HipsterIpsum.word }
    city           { Faker::Address.city }
    payment        { ["наличный расчет", "безналичный расчет"].sample }
    payer          { ["отправитель", "получатель", "третья сторона"].sample }
    comment        { Faker::Lorem.sentence }

    factory :payment_number do
      payment_number { rand(1..250) }
    end
  end
end