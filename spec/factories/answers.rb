FactoryBot.define do
  factory :answer do
    body { "MyText" }
    question { question }

    trait :invalid do
      title { nil }
    end
  end
end
