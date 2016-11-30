class Dish < ActiveRecord::Base

  belongs_to :category

  has_many :line_items

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
