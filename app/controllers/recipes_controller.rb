class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  def index
    @recipes = current_user.recipes.all
  end

  def public_index
    @recipes = Recipe.all
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def toggle_public
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe public status toggled.'
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path, alert: 'Recipe not found.'
  rescue StandardError => e
    redirect_to recipes_path, alert: "Error: #{e.message}"
  end

  def modal; end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
