class PizzaIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :pizza
end
