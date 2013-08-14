FactoryGirl.define do
  factory :review do
    first_name    { Faker::Name.first_name }
    email    { Faker::Internet.email }
    content       { Faker::HipsterIpsum.paragraph }

    factory :filled_review do
      last_name     { Faker::Name.last_name }
      company_name  { Faker::Company.name }
      logo          { Rack::Test::UploadedFile.new(
                      Dir.glob(File.join(Rails.root, 'spec', 'support', 'logos', '*.jpg')).sample
                    ) }
      city          { Faker::AddressUS.city }

      factory :moderated_filled_review do
        moderated true
      end
    end

    factory :moderated_review do
      moderated true
    end
  end
end