class AddNewCollumnToSocialNetwork < ActiveRecord::Migration
  def change
    add_column :social_networks, :position, :integer
    add_column :social_networks, :hidden, :boolean, default:0
  end
end
