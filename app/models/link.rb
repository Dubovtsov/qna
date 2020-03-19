class Link < ApplicationRecord
  belongs_to :linkable, polymorphic: true

  validates :name, :url, presence: true
  validates :url, url: true

  def is_gist?
    GistLinkService.new(self.url).gist?
  end
  
  def show_gist
    GistLinkService.new(self.url).gist
  end
end
