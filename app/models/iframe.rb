# encoding: utf-8
class Iframe < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :url, :height, :width, :top, :name
  
end