# encoding: utf-8
class SocialNetwork < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :logo, :url, :name, :position, :hidden
  
  acts_as_list

  validates :logo, presence: true

  mount_uploader :logo, LogoUploader

  scope :visible, -> { where(hidden: false) }
  
  def to_s
    "Партнер ##{id}"
  end
end