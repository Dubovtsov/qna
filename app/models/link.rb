class Link < ApplicationRecord
  belongs_to :linkable, polymorphic: true

  validates :name, :url, presence: true
  validates :url, url: true
  # validates :homepage, url: true

  def is_gist?
    @link = GistLinkService.new(self.url)
    @link.gist?
  end
  
  def show_gist
    @link = GistLinkService.new(self.url)
    @link.gist
  end
  
end
