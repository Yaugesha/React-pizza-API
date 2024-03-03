class PizzaSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :unitPrice, :soldOut, :imageUrl

  attribute :ingredients do |pizza|
    pizza.ingredients.map{ |ingredient| "#{ingredient.name}" }
  end
end
