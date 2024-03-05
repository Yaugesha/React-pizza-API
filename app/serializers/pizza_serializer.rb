class PizzaSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :unitPrice, :soldOut, :imageUrl

  attribute :ingredients do |pizza|
    pizza.ingredients.map{ |ingredient| "#{ingredient.name}" }
  end

  attribute :countOfOrders do |pizza|
    pizza.order_items.sum{ |order_item| order_item.quantity }
  end

  attribute :quantityInCurrentOrders do |pizza|
    pizza.orders.reduce(0) do |accum, order|
      if order.status == "Preparing"
        pizza_in_order = pizza.order_items.find{ |item| item.order_id == order.id}
        accum += pizza_in_order.quantity
      end
      accum
    end
  end
end
