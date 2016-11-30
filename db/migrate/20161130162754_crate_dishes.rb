class CrateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity, :default => 0
      t.boolean :published, :default => true

      t.timestamps
    end

    add_reference :dishes, :category, index: true
    add_foreign_key :dishes, :categories

  end
end
