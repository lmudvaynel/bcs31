class CreateDeliveryCityRelations < ActiveRecord::Migration
  def change
    create_table :delivery_city_relations do |t|
      t.integer :city_from_id
      t.integer :city_to_id
      t.string :delivery_time
      t.boolean :business_morning

      t.timestamps
    end
  end
end
