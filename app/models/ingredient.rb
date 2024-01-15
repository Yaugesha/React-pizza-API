class Ingredient < ApplicationRecord
    has_many :pizzasIngredient, dependent: :destroy
    has_many :pizzas, through: :pizzas_ingredients
end
