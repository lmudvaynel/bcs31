# encoding: utf-8

class Partner < ActiveRecord::Base
  attr_accessible :logo, :url

  mount_uploader :logo, LogoUploader

  def to_s
    "Партнер ##{id}"
  end
end
