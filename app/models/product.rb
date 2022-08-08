class Product < ApplicationRecord
  has_many :order_items
  has_many :order
  
  
  
  validates_numericality_of :price
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
end
