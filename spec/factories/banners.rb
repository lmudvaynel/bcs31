FactoryGirl.define do
  factory :banner do
    content Faker::HipsterIpsum.words(3).join("\n")
    url '/'
  end
end
