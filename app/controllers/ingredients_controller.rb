class IngredientsController < ApplicationController

    def index
        @ingredient = Ingredient.new
        @ingredients = Ingredient.all
    end

    def create 
        @ingredient = Ingredient.new(ingredients_params)

        if !@ingredient.save
          render :index, status: :unprocessable_entity
        end
    end

    private 
    def ingredients_params
        params.require(:ingredient).permit(:name)
    end
end
