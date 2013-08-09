class Region < ActiveRecord::Base
  attr_accessible :main_city_id, :name

  belongs_to :main_city, class_name: 'City'
  has_many :cities

  validates :main_city, presence: true
end
