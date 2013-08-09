class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :region_id
      t.boolean :central
      t.boolean :district_level
      t.boolean :affiliate
      t.string :name

      t.timestamps
    end

    add_index :cities, :region_id
    add_index :cities, :name
  end
end
