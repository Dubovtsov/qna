class QuestionsController < ApplicationController
  include Voted
  
  before_action :authenticate_user!, except: %w[index show]
  before_action :load_question, only: %w[show update destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.links.new
    @question.build_badge
  end

  def show
    @answer = Answer.new
    @answer.links.new
    @question.build_badge if @question.badge.blank?
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to @question, notice: 'Your question successfully created.'
    else
      render :new
    end
  end

  def update
    @question.update(question_params) if current_user.author_of?(@question)
  end

  def destroy
    @question.destroy if current_user.author_of?(@question)
    redirect_to questions_path, notice: 'Your question deleted successfully.'
  end

  private

  def load_question
    @question = Question.with_attached_files.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body,
                                     files: [],
                                     links_attributes: [:id, :name, :url,  :_destroy],
                                     badge_attributes: [:name, :image])
  end
end
