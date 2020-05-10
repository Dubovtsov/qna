class AnswersController < ApplicationController
  include Voted
  
  before_action :authenticate_user!
  before_action :find_question, only: %i[create]
  before_action :load_answer, only: %i[edit update best destroy]
  
  after_action :publish_answer, only: [:create]

  expose :comment, -> { answer.comments.new }

  def create
    @answer = @question.answers.create(answer_params)
    @answer.user = current_user
    @answer.save
    flash[:notice] = 'Your answer successfully created.'
  end

  def update
    @answer.update(answer_params) if current_user.author_of?(@answer)
    @question = @answer.question
  end

  def destroy
    @answer.destroy if current_user.author_of?(@answer)
    flash[:notice] = 'Answer successfully delete'
  end

  def best
    @question = @answer.question
    @answer.best! if current_user.author_of?(@question)
  end

  private

  def publish_answer
    return if @answer.errors.any?

    AnswersChannel.broadcast_to(
      @answer.question,
      answer: @answer,
      links: @answer.links,
      files: @answer.files.map { |file| { id: file.id, name: file.filename.to_s, url: url_for(file) } }
    )
  end

  def load_answer
    @answer = Answer.with_attached_files.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, files: [], links_attributes: [:id, :name, :url, :_destroy])
  end
end
