class IngredientSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :numberOfPizzas do |ingredient|
    PizzaIngredient.where(ingredient: ingredient.id).length
  end

  attribute :popularity do |ingredient|
    ordered_pizzas = OrderItem.all.length
    pizzas_with_ingredient = ingredient.pizzas
    ordered_pizzas_with_ingredient = pizzas_with_ingredient.sum { |pizza| pizza.order_items.length }
    ordered_pizzas_with_ingredient / ordered_pizzas * 100
  end
end
