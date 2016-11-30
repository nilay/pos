class CrateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
