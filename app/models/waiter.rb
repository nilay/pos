class Waiter < ActiveRecord::Base

  validates :first_name, :last_name, presence: true

  has_many :sales

  has_many :customers, through: :sales

  def name
    "#{first_name} #{last_name}"
  end

  def self.get_report_data
    Waiter.select('waiters.id, first_name, last_name, count(waiters.id) as total_orders, sum(sales.total_amount) as total_sale_amount, count(sales.customer_id) as total_customers').joins(:sales).group('waiters.id')
  end

end
