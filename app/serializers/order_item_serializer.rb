class OrderItemSerializer
  include JSONAPI::Serializer
  attribute :id do |item|
    Pizza.find(item.pizza_id).id
  end

  attribute :name do |item|
    Pizza.find(item.pizza_id).name
  end

  attribute :quantity

  attribute :unitPrice do |item|
    Pizza.find(item.pizza_id).unitPrice
  end

  attribute :totalPrice do |item|
    Pizza.find(item.pizza_id).unitPrice * item.quantity
  end
end
