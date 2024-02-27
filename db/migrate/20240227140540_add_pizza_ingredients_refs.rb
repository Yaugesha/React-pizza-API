class AddPizzaIngredientsRefs < ActiveRecord::Migration[7.1]
  def change
    add_reference :pizza_ingredients, :pizza, null: false
    add_reference :pizza_ingredients, :ingredient, null: false
  end
end
