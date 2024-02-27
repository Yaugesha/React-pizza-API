class Ingredient < ApplicationRecord
  has_many :pizza_ingredients, dependent: :destroy
  has_many :pizzas, through: :pizza_ingredients
end
