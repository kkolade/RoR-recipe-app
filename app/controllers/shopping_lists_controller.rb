class ShoppingListsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    @food_info = calculate_food_info(@recipe.recipe_foods.includes(:food), @inventory.inventory_foods.includes(:food))
    @total_price = @food_info.sum { |info| info[:price_difference] }
    @different_foods_count = @food_info.size
  end

  private

  def calculate_food_info(recipe_foods, inventory_foods)
    food_info = []
    recipe_foods.each do |recipe_food|
      inventory_food = inventory_foods.find_by(food: recipe_food.food)
      recipe_food_price_difference = recipe_food.food.price * recipe_food.quantity
      if inventory_food.nil?
        inventory_food_price_difference = 0
        quantity = recipe_food.quantity
      else
        inventory_food_price_difference = inventory_food.food.price * inventory_food.quantity
        quantity = recipe_food.quantity - inventory_food.quantity
      end
      price_difference = recipe_food_price_difference - inventory_food_price_difference
      next unless price_difference.positive?

      food_info << {
        name: recipe_food.food.name, quantity:,
        measurement_unit: recipe_food.food.measurement_unit, price_difference:
      }
    end
    food_info
  end

  def record_not_found
    redirect_to root_path, alert: 'Invalid recipe or inventory ID.'
  end
end
