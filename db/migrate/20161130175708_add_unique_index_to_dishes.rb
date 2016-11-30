class AddUniqueIndexToDishes < ActiveRecord::Migration
  def change
    add_index :dishes, [:category_id, :name], :unique => true
    add_index :categories, :name, :unique => true
  end
end
