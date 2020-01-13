FactoryBot.define do
  factory :question do
    body { "MyText" }
    user

    trait :invalid do
      title { nil }
    end

    sequence :title do |n|
      "MyString#{n}"
    end
  end
end
