class Table < ActiveRecord::Base

  validates :name, :description, presence: true
  validates :capacity, presence:true, numericality: { only_integer: true }

end
