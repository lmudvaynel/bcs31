class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :online_couriers , :type, :transportation
  end

  def down
  end
end
