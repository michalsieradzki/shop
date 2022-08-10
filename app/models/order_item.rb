class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order_id, presence: { message: "order_id nie istnieje"}
  validates :product_id, presence: {message: "product_id nie istnieje"}
  validates :quantity, numericality: { greater_than: 0}

end
