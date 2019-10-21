class Order < ApplicationRecord
  belongs_to :user
  has_many :trinket_orders
  has_many :trinkets, through: :trinket_orders
end
