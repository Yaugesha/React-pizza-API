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
    @pizza = Pizza.new(pizza_params_without_ingredients)

    add_ingredients

    if @pizza.save
      render json: PizzaSerializer.new(@pizza).serializable_hash[:data][:attributes], status: :created
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pizzas/1
  def update
    update_ingredients

    if @pizza.update(pizza_params_without_ingredients)
      render json: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pizzas/1
  def destroy
    @pizza.destroy!

    render json: { message: 'Successfully deleted' }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
      @pizza_ingredients = @pizza.ingredients
    end

    # Only allow a list of trusted parameters through.
    def pizza_params
      params.require(:pizza).permit(:name, :unitPrice, :soldOut, :image, ingredients: [:id, :name, :numberOfPizzas, :popularity])
    end

    def pizza_params_without_ingredients
      pizza_params.except(:ingredients)
    end

    def ingredients_from_params
      ingredients_params = JSON.parse(params[:pizza][:ingredients])
      ingredients_params.collect { |ingredient| Ingredient.find(ingredient["id"]) }
    end


    def add_ingredients
      ingredients = ingredients_from_params
      @pizza.ingredients << ingredients
    end

    def update_ingredients
      ingredients = ingredients_from_params

      # add new ingredients
      ingredients.each do |new_ingredient|
        unless @pizza_ingredients.include? new_ingredient
          @pizza_ingredients << new_ingredient
        end
      end

      # remove deleted ingredients
      @pizza_ingredients.each do |curent_ingredient|
        unless ingredients.include? curent_ingredient
          p "remove"
          @pizza_ingredients.destroy curent_ingredient
        end
      end
    end
end
