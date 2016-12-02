class UpdateSales < ActiveRecord::Migration
  def change
    remove_column :sales, :amount
    change_column_default :sales, :total_amount, 0.0
    change_column_default :sales, :remaining_amount, 0.0
    change_column_default :sales, :discount, 0.0
    change_column_default :sales, :tax, 0.0

  end
end
