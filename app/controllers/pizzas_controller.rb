class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.all
  end

  def show 
    # доступ к параметрам запроса происходит через хэш params
    @pizza = Pizza.find(params[:id])
  end

  def new
    @pizza = Pizza.new
  end

  def create 
    @pizza = Pizza.new(pizza_params)

    if @pizza.save
      redirect_to @pizza
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @pizza = Pizza.find(params[:id])
  end

  def update
    @pizza = Pizza.find(params[:id])

    if @pizza.update(pizza_params)
      redirect_to @pizza
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pizza = Pizza.find(params[:id])
    @pizza.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def pizza_params
      params.require(:pizza).permit(:name, :unitPrice)
    end

end
