module Voted
  extend ActiveSupport::Concern

  included do 
    before_action :set_votable, only: [:voteup, :votedown]
  end

  def voteup
    vote = Vote.vote_up(current_user, @votable)
    respond_to do |format|
      format.json do
        if vote.nil? || vote.save
          render json: { object_id: @votable.id, value: @votable.rating, model: @votable.class.name.underscore }
        else
          render json: vote.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def votedown
    vote = Vote.vote_down(current_user, @votable)
    respond_to do |format|
      format.json do
        if vote.nil? || vote.save
          render json: { object_id: @votable.id, value: @votable.rating, model: @votable.class.name.underscore }
        else
          render json: vote.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private
  
  def model_klass
    controller_name.classify.constantize
  end

  def set_votable
    @votable = model_klass.find(params[:id])
  end

  def votable
    send(controller_name.singularize)
  end
end