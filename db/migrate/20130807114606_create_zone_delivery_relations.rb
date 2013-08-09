class CreateZoneDeliveryRelations < ActiveRecord::Migration
  def change
    create_table :zone_delivery_relations do |t|
      t.integer :zone_id
      t.integer :delivery_city_relation_id

      t.timestamps
    end
  end
end
