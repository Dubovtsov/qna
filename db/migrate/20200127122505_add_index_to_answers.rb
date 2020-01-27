class AddIndexToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_index :answers, [:best, :question_id], unique: true, where: "best IS TRUE"
  end
end
