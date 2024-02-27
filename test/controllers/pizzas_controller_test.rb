require "test_helper"

class PizzasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza = pizzas(:one)
  end

  test "should get index" do
    get pizzas_url, as: :json
    assert_response :success
  end

  test "should create pizza" do
    assert_difference("Pizza.count") do
      post pizzas_url, params: { pizza: { imageUrl: @pizza.imageUrl, name: @pizza.name, soldOut: @pizza.soldOut, unitPrice: @pizza.unitPrice } }, as: :json
    end

    assert_response :created
  end

  test "should show pizza" do
    get pizza_url(@pizza), as: :json
    assert_response :success
  end

  test "should update pizza" do
    patch pizza_url(@pizza), params: { pizza: { imageUrl: @pizza.imageUrl, name: @pizza.name, soldOut: @pizza.soldOut, unitPrice: @pizza.unitPrice } }, as: :json
    assert_response :success
  end

  test "should destroy pizza" do
    assert_difference("Pizza.count", -1) do
      delete pizza_url(@pizza), as: :json
    end

    assert_response :no_content
  end
end
