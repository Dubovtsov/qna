class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: { minimum: 4 }
  # validates :best, uniqueness: { scope: :question_id } if :best?
  
  default_scope {order(best: :desc)}

  def best!
    transaction do
      question.answers.update_all(best: false)
      update!(best: true)
    end
  end
end
