class AddPublishedAtToNewsPages < ActiveRecord::Migration
  def change
    add_column :news_pages, :published_at, :datetime
  end
end
