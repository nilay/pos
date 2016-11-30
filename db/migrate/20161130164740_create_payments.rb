class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :payment_type

      t.timestamps

    end

    add_reference :payments, :sale, index: true
    add_foreign_key :payments, :sales

  end
end
