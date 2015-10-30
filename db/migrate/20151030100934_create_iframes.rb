class CreateIframes < ActiveRecord::Migration
  def change
    create_table :iframes do |t|

      t.string :name
      t.string :url
      t.string :height
      t.string :width
      t.string :top

      t.timestamps
    end
  end
end
