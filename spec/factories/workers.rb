# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :worker do
    name     { Faker::Name.last_name }
    patronymic    { Faker::Name.last_name}
    job           { Faker::Name.first_name }
    phone         { Faker::PhoneNumber.phone_number }
    photo         { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'logos', "logo_#{rand(1..3)}.jpg")) }
  end
end