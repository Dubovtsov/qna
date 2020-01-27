class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: { minimum: 4 }
  # validates :best, uniqueness: { scope: :question_id }
  
  default_scope {order(best: :desc)}

  def best!
    transaction do
      Answer.where(question_id: question_id, best: true).update_all(best: false)
      update!(best: true)
    end
  end
end
