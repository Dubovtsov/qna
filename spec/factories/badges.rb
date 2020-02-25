FactoryBot.define do
  factory :badge do
    name { "MyString" }
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/badge.png", 'image/png') }

    question
  end
end
