class Pizza < ApplicationRecord
  has_many :pizza_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_ingredients
end
