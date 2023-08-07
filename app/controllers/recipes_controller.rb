class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes.all
  end

  def public_index
    @recipes = Recipe.all
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end
end
