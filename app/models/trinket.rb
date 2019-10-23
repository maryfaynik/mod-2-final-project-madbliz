class Trinket < ApplicationRecord
  belongs_to :favorite
 
  has_many :trinket_orders

  has_many :orders, through: :trinket_orders

  PRODUCTS = {"Mug" => {img_url: "mug.svg"}, "T-Shirt"=> {img_url: "tshirt.svg"}, "Book"=> {img_url: "book.svg"}, "Dish Towel"=> {img_url: "towel.svg"}, "Sticker"=> {img_url: "sticker.svg"}, "Magnet"=> {img_url: "magnet.svg"}}

  validates :product_type, inclusion: {in: PRODUCTS}

  def madlib
    self.favorite.madlib
  end
end
