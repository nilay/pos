class Customer < ActiveRecord::Base

  has_many :sales

  validates :first_name, :login, :email, presence: true
end
