class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :line1, presence: true
  validates :line2, presence: true
  validates :city, presence: true
  validates :zip, presence: true
end
