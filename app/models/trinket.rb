class Trinket < ApplicationRecord
  belongs_to :favorite
 
  has_many :trinket_orders

  has_many :orders, through: :trinket_orders

  PRODUCTS = {"Mug" => {price: 10.00}, "T-Shirt" => {price: 20.00}, "Book" => {price: 15.00}, "Dish Towel" => {price: 15.99}, "Sticker" => {price: 6.99}, "Magnet" => {price: 4.99}}

  validates :product_type, inclusion: {in: PRODUCTS}

  def madlib
    self.favorite.madlib
  end

  def prod_and_price
    "#{self.product_type}: $#{self.price}"
  end
end
