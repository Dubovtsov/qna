class Question < ApplicationRecord
  validates :title, :body, presence: true, length: { minimum: 4 }

  has_many :answers
end
