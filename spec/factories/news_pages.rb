FactoryGirl.define do
  factory :news_page do
    title         { Faker::HipsterIpsum.word }
    content       { Faker::HipsterIpsum.paragraph }
    description   { Faker::HipsterIpsum.paragraph }
    image         { Rack::Test::UploadedFile.new(
                      Dir.glob(File.join(Rails.root, 'spec', 'support', 'news_image', '*.jpg')).sample
                  ) }
    end
end
