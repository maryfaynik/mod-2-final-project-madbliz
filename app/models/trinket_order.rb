class TrinketOrder < ApplicationRecord
  belongs_to :order
  belongs_to :trinket
end
