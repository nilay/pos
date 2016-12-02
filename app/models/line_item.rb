class LineItem < ActiveRecord::Base

  belongs_to :sale
  belongs_to :dish

  validates :quantity, presence:true, numericality: { only_integer: true }
  validates :price, :total_price, presence:true, numericality: { only_numeric: true }

  after_save :finalize_sale

  def set_price(price)
    self.price = price
    self.total_price = price * quantity
  end

  private
  def finalize_sale
    sale.finalize
  end

end
