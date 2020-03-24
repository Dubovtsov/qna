module Votable
  extend ActiveSupport::Concern
  
  included do
    has_many :votes, dependent: :destroy, as: :votable
  end

  def voteup(user)
    vote(1, user)
  end 

  def votedown(user)
    vote(-1, user)
  end

  # rate

  def rating
    votes.sum(:value)
  end  

  private 

  def vote(value, user)
    vote = votes.where(user: user, value: value).first 

    if vote
      vote.destroy
    else
      votes.create(value: value, user: user)
    end 
  end
end
