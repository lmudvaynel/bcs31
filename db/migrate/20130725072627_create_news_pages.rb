class CreateNewsPages < ActiveRecord::Migration
  def change
    create_table :news_pages do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :description
      t.timestamps
    end
  end
end
