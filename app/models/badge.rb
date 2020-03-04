class Badge < ApplicationRecord
  belongs_to :question
  has_many :user_badges, dependent: :destroy
  has_many :user, through: :user_badges

  has_one_attached :image

  validates :name, presence: true
  validate :attached_image

  private

  def attached_image
    errors.add(:image, 'You must add an image file.') unless image.attached?
    errors.add(:image, 'Wrong file type.') unless image.attached? && image.content_type =~ /^image/
  end
end
