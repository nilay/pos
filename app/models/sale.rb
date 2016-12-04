class Sale < ActiveRecord::Base

  belongs_to :customer
  belongs_to  :waiter
  belongs_to :table

  has_many :line_items, dependent: :destroy
  has_many :dishes, through: :line_items
  has_many :payments, dependent: :destroy

  def add_dish(dish)
    line_item = line_items.find_by(dish_id: dish.id)
    line_item.quantity = line_item.quantity + 1 if line_item

    line_item = line_items.new unless line_item
    line_item.set_price(dish.price)
    line_item.dish_id = dish.id
    line_item.save

    finalize

    line_item

  end

  def finalize
    self. total_amount = line_items.collect { |li| li.total_price ? li.total_price : 0 }.sum
    self.tax = self.total_amount * 0.14
    self.discount = 0
    self.save
  end

  def net_amount
    (self.total_amount || 0 ) + (self.tax || 0) - (self.discount || 0 )
  end

  def self.report_data
    Sale.select("to_char(sales.created_at,'MM/DD/YYYY') as sale_date, count(sales.id) as total_orders, sum(sales.total_amount) as total_sale_amount, sum(sales.discount) as total_discount, sum(sales.tax) as total_tax").group("to_char(sales.created_at,'MM/DD/YYYY')")

  end

end
