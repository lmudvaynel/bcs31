FactoryGirl.define do
  factory :tariff do
    cargo_kind :document
    weight_start { rand(0..10) }
    weight_end { weight_start + rand(0..10) }
    price_cents { rand(100_00..1000_00) }
    additional_price_cents { rand(50_00..100_00) }

    factory :document_tariff do
      cargo_kind :document
    end

    factory :goods_tariff do
      cargo_kind :goods
    end
  end
end