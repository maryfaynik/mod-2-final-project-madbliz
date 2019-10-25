class Order < ApplicationRecord
  belongs_to :user
  has_many :trinket_orders
  has_many :trinkets, through: :trinket_orders


  def number
    self.created_at.to_i + self.id 
  end

  def subtotal
    self.trinkets.inject(0) {|sum, trinket| trinket.price + sum}.round(2)
  end

end

