class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :url
      t.string :logo

      t.timestamps
    end
  end
end
