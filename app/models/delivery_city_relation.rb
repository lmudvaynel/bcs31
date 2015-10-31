class DeliveryCityRelation < ActiveRecord::Base
  attr_accessible :business_morning, :delivery_time, :city_from, 
                  :city_to, :zones, :city_from_id, :city_to_id, :zone_delivery_relations_attributes

  has_many :zone_delivery_relations
  has_many :zones, through: :zone_delivery_relations
  belongs_to :city_from, class_name: 'City'
  belongs_to :city_to, class_name: 'City'

  accepts_nested_attributes_for :zone_delivery_relations

end
