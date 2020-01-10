class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :load_answer, only: %i[edit update destroy]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    redirect_to @question, notice: 'Your answer successfully created.' if @answer.save
  end

  def destroy
    @answer.destroy if author_of?(@answer)
    redirect_to @answer.question
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
