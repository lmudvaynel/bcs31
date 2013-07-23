class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :th_name
      t.string :logo
      t.string :phone
      t.string :job

      t.timestamps
    end
  end
end
