class Favorite < ApplicationRecord
  belongs_to :madlib
  belongs_to :user
end
