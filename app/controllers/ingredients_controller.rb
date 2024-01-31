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

    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])

        if @ingredient.update(ingredients_params)
            redirect_to action: index
        else
            render :index, status: :unprocessable_entity
        end
    end

    private 
    def ingredients_params
        params.require(:ingredient).permit(:name)
    end
end
