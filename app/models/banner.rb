# encoding: utf-8
class Banner < ActiveRecord::Base
  attr_accessible :content, :url, :image

  mount_uploader :image, BannerImageUploader

  validates :content, presence: true

  def paragraph(n)
    content.split("\n").select(&:present?)[n]
  end

  def to_s
    "Баннер ##{id}"
  end
end
