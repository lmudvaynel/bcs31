class NewsPage < ActiveRecord::Base
  attr_accessible :title, :content, :image, :description
   
  mount_uploader :image, NewsPageImageUploader
  
  validates :title, :content, presence: true
end
