class Trinket < ApplicationRecord
  belongs_to :favorite
 
  has_many :trinket_orders

  has_many :orders, through: :trinket_orders

  PRODUCTS = ["Mug", "T-Shirt", "Book", "Dish Towel", "Sticker", "Magnet"]

  validates :product_type, inclusion: {in: PRODUCTS}

  def madlib
    self.favorite.madlib
  end
end
