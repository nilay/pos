class Sale < ActiveRecord::Base

  belongs_to :customer
  has_one  :waiter
  has_one :table

  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items
  has_many :payments, dependent: :destroy

  def finalize
    self. total_amount = line_items.collect { |li| li.total_price ? li.total_price : 0 }.sum
    self.tax = self.total_amount * 0.14
    self.discount = 0
    self.save
  end

  def net_amount
    (self.total_amount || 0 ) + (self.tax || 0) - (self.discount || 0 )
  end

end
