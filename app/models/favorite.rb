class Favorite < ApplicationRecord
  belongs_to :madlib
  belongs_to :user
  has_many :trinkets
end
