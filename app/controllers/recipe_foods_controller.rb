class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Food was successfully added to the recipe.'
    else
      render 'recipes/show'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Food was successfully removed from the recipe.'
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe), notice: 'Food was successfully updated.'
    else
      render 'recipe_foods/edit'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
