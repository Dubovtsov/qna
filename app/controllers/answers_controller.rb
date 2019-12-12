class AnswersController < ApplicationController
  before_action :load_answer, only: [:show, :edit, :update, :destroy]
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def show
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @answer.update(answer_params)
    if @answer.save
      redirect_to @question
    else
      render :edit
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

  def answer_params
    params.require(:answer).permit(:body)
  end
end
