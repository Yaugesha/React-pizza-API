class Api::V1::PizzasController < ApplicationController
  before_action :set_pizza, only: %i[ show update destroy ]

  # GET /pizzas
  def index
    @pizzas = Pizza.all

    pizzas_arr = @pizzas.map{ |pizza| PizzaSerializer.new(pizza).serializable_hash[:data][:attributes] }

    render json: pizzas_arr.to_json
  end

  # GET /pizzas/1
  def show
    render json: PizzaSerializer.new(@pizza).serializable_hash[:data][:attributes]
  end

  # POST /pizzas
  def create
    ingredients_params =  JSON.parse(params[:pizza][:ingredients])
    pizza_params_without_ingredients = pizza_params.except(:ingredients)

    ingredients = ingredients_params.collect { |ingredient| Ingredient.find(ingredient["id"]) }

    @pizza = Pizza.new(pizza_params_without_ingredients)

    @pizza.ingredients << ingredients

    if @pizza.save
      render json: PizzaSerializer.new(@pizza).serializable_hash[:data][:attributes], status: :created
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pizzas/1
  def update
    if @pizza.update(pizza_params)
      render json: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pizzas/1
  def destroy
    @pizza.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_params
      params.require(:pizza).permit(:name, :unitPrice, :soldOut, :image, ingredients: [:id, :name])
    end
end
