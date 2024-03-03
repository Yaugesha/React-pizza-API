class OrderSerializer
  include JSONAPI::Serializer

  attributes :id, :customer, :phone, :address, :status, :priority

  attribute :createdAt do |order|
    order.created_at
  end

  attribute :estimatedDelivery do |order|
    order.created_at + 40.minutes
  end

  attribute :cart do |order|
    order.order_items.map do |item|
      OrderItemSerializer.new(item).serializable_hash[:data][:attributes]
    end
  end

  attribute :orderPrice do |order|
    order.order_items.reduce(0) {|price, item| price += Pizza.find(item.pizza_id).unitPrice * item.quantity}
  end
end
