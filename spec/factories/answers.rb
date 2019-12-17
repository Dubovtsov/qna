FactoryBot.define do
  factory :answer do
    body { "MyText" }
    # question_id { 1 }
    association :question

    trait :invalid do
      body { nil }
    end
  end
end
