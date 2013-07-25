class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :photo
      t.string :phone
      t.string :job

      t.timestamps
    end
  end
end
