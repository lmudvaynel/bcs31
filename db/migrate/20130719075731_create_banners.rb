class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :content
      t.string :url

      t.timestamps
    end
  end
end
