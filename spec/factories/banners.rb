FactoryGirl.define do
  factory :banner do
    content Faker::HipsterIpsum.words(3).join("\n")
    url '/'
    image   Rack::Test::UploadedFile.new(
              Dir.glob(File.join(Rails.root, 'app', 'assets', 'images', 'slider_rocket.png')).sample
            ) 
  end
end
