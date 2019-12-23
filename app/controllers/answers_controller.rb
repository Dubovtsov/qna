class AnswersController < ApplicationController
  before_action :find_question, only: %i[create]
  before_action :load_answer, only: %i[show edit update destroy]

  # def new
  #   @answer = Answer.new
  # end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question, notice: 'Your answer successfully created.'
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
