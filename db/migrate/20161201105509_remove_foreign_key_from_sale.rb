class RemoveForeignKeyFromSale < ActiveRecord::Migration
  def change
    remove_foreign_key :sales, :customers
    remove_foreign_key :sales, :tables
    remove_foreign_key :sales, :waiters
    remove_column :dishes, :quantity
  end
end
