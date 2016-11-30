class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, :default => 1
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :total_price, :precision => 8, :scale => 2

      t.timestamps
    end

    add_reference :line_items, :sale, index: true
    add_foreign_key :line_items, :sales

    add_reference :line_items, :dish, index: true
    add_foreign_key :line_items, :dishes

  end
end
