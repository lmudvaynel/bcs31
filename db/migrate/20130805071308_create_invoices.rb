class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :send_from
      t.string :arrival_to

      t.timestamps
    end
  end
end
