class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true, touch: true

  validate :author_cant_vote
  validates :value, inclusion: { in: [-1, 1], message: "You can't vote twice" }

  def self.vote_up(user, votable)
    vote = Vote.find_or_create_by(user: user, votable: votable)
    vote.value += 1
    destroy_if_revote(vote)
  end

  def self.vote_down(user, votable)
    vote = Vote.find_or_create_by(user: user, votable: votable)
    vote.value -= 1
    destroy_if_revote(vote)
  end

  def self.destroy_if_revote(vote)
    return vote unless vote.value.zero?
    vote.destroy
    nil
  end

  private 

  def author_cant_vote
    errors.add(:base, "Author can't vote") if user&.author_of?(votable)
  end
end
