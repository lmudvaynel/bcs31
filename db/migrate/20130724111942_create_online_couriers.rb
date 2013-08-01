class CreateOnlineCouriers < ActiveRecord::Migration
  def change
    create_table :online_couriers do |t|
      t.string :transportation
      t.date   :date
      t.string :time_start
      t.string :time_end
      t.string :full_name
      t.string :phone
      t.string :company
      t.string :address
      t.string :weight
      t.string :amount
      t.string :size
      t.string :cargo_type
      t.string :city
      t.string :payment
      t.string :payer
      t.string :payer_number
      t.string :comment

      t.timestamps
    end
  end
end