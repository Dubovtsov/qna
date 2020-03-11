class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :links, dependent: :destroy, as: :linkable

  has_many_attached :files

  validates :body, presence: true, length: { minimum: 4 }

  accepts_nested_attributes_for :links, reject_if: :all_blank

  default_scope {order(best: :desc)}

  def best!
    transaction do
      question.answers.update_all(best: false)
      update!(best: true)
      # user.badges << question.badge if question.badge.present?
      question.badge&.update!(user: user)
    end
  end
end
