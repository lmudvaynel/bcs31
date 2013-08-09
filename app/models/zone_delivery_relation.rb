class ZoneDeliveryRelation < ActiveRecord::Base
  attr_accessible :delivery_city_relation_id, :zone_id

  belongs_to :zone
  belongs_to :delivery_city_relation
end
