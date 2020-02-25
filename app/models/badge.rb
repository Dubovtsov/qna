class Badge < ApplicationRecord
  belongs_to :answer, optional: true
  belongs_to :question

  has_one_attached :image

  validates :name, presence: true
end
