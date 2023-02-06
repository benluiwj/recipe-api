class Recipe < ApplicationRecord
  belongs_to :ingredients
  belongs_to :methods
end
