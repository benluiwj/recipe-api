class Recipe < ApplicationRecord
  belongs_to :user
  has_many :procedure
  has_many :ingredient
end
