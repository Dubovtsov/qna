FactoryBot.define do
  factory :question do
    body { "MyText" }
    user

    trait :with_file do
      after :create do |question|
        file_path = Rails.root.join('spec', 'rails_helper.rb')
        file = fixture_file_upload(file_path, 'application/rb')
        question.files.attach(file)
      end
    end

    trait :invalid do
      title { nil }
    end

    sequence :title do |n|
      "MyString#{n}"
    end
  end
end
