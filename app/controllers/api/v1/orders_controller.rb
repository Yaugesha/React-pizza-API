class Api::V1::OrdersController < ApplicationController
  def create
    @order = Order.create(order_params.except(:cart))

    order_params[:cart].map do |item|
      @order.order_items << OrderItem.create(pizza_id: item[:id], quantity: item[:quantity])
    end
    if @order.save
      render json: OrderSerializer.new(@order).serializable_hash[:data][:attributes], status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])

    render json: OrderSerializer.new(@order).serializable_hash[:data][:attributes], status: :ok
  end


  private
  def order_params
    params.require(:order).permit(:address, :customer, :phone, :priority, cart: cart_params)
  end

  def cart_params
    [:id, :name, :unitPrice, :soldOut, :imageUrl, :quantity, :totalPrice, ingredients: []]
  end
end
