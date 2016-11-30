class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :total_amount, :precision => 8, :scale => 2
      t.decimal :remaining_amount
      t.decimal :discount, :precision => 8, :scale => 2
      t.decimal :tax, :precision => 8, :scale => 2
      t.text :comments

      t.timestamps
    end

    add_reference :sales, :customer, index: true
    add_foreign_key :sales, :customers

    add_reference :sales, :waiter, index: true
    add_foreign_key :sales, :waiters

    add_reference :sales, :table, index: true
    add_foreign_key :sales, :tables

  end
end
