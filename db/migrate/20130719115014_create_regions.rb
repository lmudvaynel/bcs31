class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :main_city_id

      t.timestamps
    end

    add_index :regions, :name
  end
end
