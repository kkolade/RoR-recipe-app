class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def public_index
    @recipes = Recipe.includes(:user).where(is_public: true)
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  end

  def toggle_public
    @recipe.update(is_public: !@recipe.is_public)
    redirect_to @recipe, notice: 'Recipe public status changed.'
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path, alert: 'Recipe not found.'
  rescue StandardError => e
    redirect_to recipes_path, alert: "Error: #{e.message}"
  end

  def modal; end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  private

  def set_recipe
    @recipe = Recipe.includes(:user, :recipe_foods).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :is_public, :preparation_time, :cooking_time)
  end
end
