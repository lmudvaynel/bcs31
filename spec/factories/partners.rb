FactoryGirl.define do
  factory :partner do
    url { Faker::Internet.uri('http') }
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'logos', "logo_#{rand(1..3)}.jpg")) }
  end
end