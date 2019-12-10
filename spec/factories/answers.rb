FactoryBot.define do
  factory :answer do
    body { "MyText" }
    question { Question.take }
  end
end
