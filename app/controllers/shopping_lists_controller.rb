class ShoppingListsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @inventory = Inventory.includes(:inventory_foods).find(params[:inventory_id])

    @food_info = calculate_food_info(@recipe.recipe_foods.includes(:food), @inventory.inventory_foods.includes(:food))
    @total_price = @food_info.sum { |info| info[:price_difference] }
    @different_foods_count = @food_info.size
  end

  private

  def calculate_food_info(recipe_foods, inventory_foods)
    food_info = []

    recipe_foods.each do |recipe_food|
      inventory_food = inventory_foods.find_by(food: recipe_food.food)

      next if recipe_food.food.nil? || inventory_food.nil?

      recipe_food_price_difference = recipe_food.food.price * recipe_food.quantity
      inventory_food_price_difference = inventory_food.food.price * inventory_food.quantity
      price_difference = recipe_food_price_difference - inventory_food_price_difference

      next unless price_difference.positive?

      food_info << {
        name: recipe_food.food.name,
        quantity: recipe_food.quantity - inventory_food.quantity,
        measurement_unit: recipe_food.food.measurement_unit,
        price_difference:
      }
    end

    food_info
  end

  def record_not_found
    redirect_to root_path, alert: 'Invalid recipe or inventory ID.'
  end
end
