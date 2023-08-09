class FoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = @recipe.foods.build(food_params)

    if @food.save
      redirect_to recipe_path(@recipe), notice: 'Food was successfully added.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
