class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :logo
      t.string :city
      t.text :content
      t.boolean :moderated, :default => false

      t.timestamps
    end
  end
end
