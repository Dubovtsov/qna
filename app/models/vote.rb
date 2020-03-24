class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true, touch: true

  validate :author_cant_vote

  private 

  def author_cant_vote
    errors.add(:base, "Author can't vote") if user&.author_of?(votable)
  end
end
