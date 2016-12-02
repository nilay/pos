class LineItem < ActiveRecord::Base

  belongs_to :sale
  belongs_to :dish

  def set_price(price)
    self.price = price
    self.total_price = price * quantity
  end
end
