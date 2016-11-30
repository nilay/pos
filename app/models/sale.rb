class Sale < ActiveRecord::Base

  belongs_to :customer
  has_one  :waiter
  has_one :table

  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items
  has_many :payments, dependent: :destroy

end
