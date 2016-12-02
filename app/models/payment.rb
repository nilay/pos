class Payment < ActiveRecord::Base

  validates :payment_type, presence:true
  validates :amount, presence:true, numericality: { only_numeric: true }

  belongs_to :sale
end
