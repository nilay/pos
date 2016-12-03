class Customer < ActiveRecord::Base

  has_many :sales

  validates :first_name, :last_name, :email_address, :address, :city, :state, :zip, presence: true
  validates_format_of :email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def name
    "#{first_name} #{last_name}"
  end
end
