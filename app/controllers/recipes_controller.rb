class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def public_index
    @recipes = Recipe.includes(:user).where(is_public: true)
    @recipe_totals = calculate_recipe_totals(@recipes)
  end

  def show
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def toggle_public
    @recipe.update(is_public: !@recipe.is_public)
    redirect_to @recipe, notice: 'Recipe public status changed.'
  end

  def destroy
    @recipe.recipe_foods.destroy_all
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path, alert: 'Recipe not found.'
  rescue StandardError => e
    redirect_to recipes_path, alert: "Error: #{e.message}"
  end

  def modal
    @recipe = Recipe.find(params[:id])
    render layout: false
  end

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
    @recipe = Recipe.includes(:user).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :is_public, :preparation_time, :cooking_time)
  end

  def destroy_related_records
    recipe_foods = @recipe.recipe_foods

    recipe_foods.each do |recipe_food|
      shopping_list = ShoppingList.find_by(recipe_food:)
      shopping_list&.destroy
    end

    recipe_foods.destroy_all
  end

  def calculate_recipe_totals(recipes)
    recipe_totals = []

    recipes.each do |recipe|
      total_foods = 0
      total_price = 0

      recipe.recipe_foods.includes(:food).each do |recipe_food|
        food = recipe_food.food
        total_foods += 1
        total_price += (recipe_food.quantity * food.price)
      end

      recipe_totals << { recipe:, total_foods:, total_price: }
    end

    recipe_totals
  end
end
