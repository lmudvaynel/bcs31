# encoding: utf-8

class Partner < ActiveRecord::Base
  attr_accessible :logo, :url

  validates :logo, presence: true

  mount_uploader :logo, LogoUploader

  def to_s
    "Партнер ##{id}"
  end
end