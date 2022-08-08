class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  #validate :order_id, presence: true
  #validate :product_id, presence: true
end
