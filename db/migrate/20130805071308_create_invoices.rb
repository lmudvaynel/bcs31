class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string    :status
      t.integer   :number
      t.string    :send_from
      t.string    :arrival_to
      t.string    :recipient_surname
      t.string    :recipient_role
      t.datetime  :delivered_at

      t.timestamps
    end
  end
end
