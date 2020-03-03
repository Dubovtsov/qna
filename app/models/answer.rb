class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :links, dependent: :destroy, as: :linkable
  has_one :badge

  has_many_attached :files

  validates :body, presence: true, length: { minimum: 4 }
  # validates :best, uniqueness: { scope: :question_id } if :best?

  accepts_nested_attributes_for :links, reject_if: :all_blank

  default_scope {order(best: :desc)}

  def best!
    transaction do
      question.answers.update_all(best: false)
      update!(best: true)
      question.badge&.update!(answer: self)
      # answer.user.badges << question.badge
    end
  end
end
