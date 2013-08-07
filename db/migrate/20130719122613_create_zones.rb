class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.string :provider
      t.integer :delivery_city_relation_id

      t.timestamps
    end

    add_index :zones, :delivery_city_relation_id
  end
end
