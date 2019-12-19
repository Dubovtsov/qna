class Question < ApplicationRecord
  has_many :answers

  validates :title, :body, presence: true, length: { minimum: 4 }
end
