class Waiter < ActiveRecord::Base

  validates :first_name, :last_name, presence: true

  has_many :sales

  has_many :customers, through: :sales

end
