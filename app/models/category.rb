class Category < ActiveRecord::Base

  has_many :dishes

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
