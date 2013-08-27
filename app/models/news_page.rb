class NewsPage < ActiveRecord::Base
  attr_accessible :title, :content, :image, :description, :published_at
   
  mount_uploader :image, NewsPageImageUploader
  
  validates :title, :content, :published_at, presence: true
end
