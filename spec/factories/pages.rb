FactoryGirl.define do
  sequence(:slug_uid) { |n| "#{n}"}
  factory :page do
    name    { Faker::HipsterIpsum.word }
    content { Faker::HipsterIpsum.paragraphs(3).join(' ') }
    slug    { "#{name.parameterize}-#{generate(:slug_uid)}" }
  end
end
