FactoryBot.define do
  factory :answer do
    body { "Answer body" }
    question
    user

    trait :with_file do
      after :create do |answer|
        file_path = Rails.root.join('spec', 'rails_helper.rb')
        file = fixture_file_upload(file_path, 'application/rb')
        answer.files.attach(file)
      end
    end

    trait :invalid do
      body { nil }
    end
  end
end
