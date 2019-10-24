class Trinket < ApplicationRecord
  belongs_to :favorite
 
  has_many :trinket_orders

  has_many :orders, through: :trinket_orders

  PRODUCTS = {"Mug" => {img_url: "mug.svg", price: 10.00}, "T-Shirt"=> {img_url: "tshirt.svg", price: 20.00}, "Dish Towel"=> {img_url: "towel.svg", price: 5.99}, "Sticker"=> {img_url: "sticker.svg", price: 4.99}, "Magnet"=> {img_url: "magnet.svg", price: 6.99}}


  validates :product_type, inclusion: {in: PRODUCTS}

  def madlib
    self.favorite.madlib
  end

  def prod_and_price
    "#{self.product_type}: $#{self.price}"
  end
end
