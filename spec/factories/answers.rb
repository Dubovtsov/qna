FactoryBot.define do
  factory :answer do
    body { "MyText" }
    association :question

    trait :invalid do
      title { nil }
    end
  end
end
