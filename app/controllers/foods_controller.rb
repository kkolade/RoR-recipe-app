class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
  
  def new
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @food = @recipe.foods.build(food_params)

    if @food.save
      redirect_to recipe_path(@recipe), notice: 'Food was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully deleted.'    
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
