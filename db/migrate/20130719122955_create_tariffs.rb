class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.integer :zone_id
      t.float :weight_start
      t.float :weight_end
      t.integer :price_cents
      t.boolean :contract_price
      t.integer :additional_price_cents
      t.string :cargo_kind

      t.timestamps
    end

    add_index :tariffs, :zone_id
    add_index :tariffs, :weight_start
    add_index :tariffs, :weight_end
  end
end
