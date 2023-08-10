require 'rails_helper'

RSpec.describe 'Shopping List', type: :feature do
  include Devise::Test::IntegrationHelpers # Allows us to create a devise session

  before do
    @user = User.create(id: 1, name: 'User', email: 'user@example.com', password: '123456')
    @recipe = Recipe.create(id: 1, user: @user, name: 'Apple pie')
    @inventory = Inventory.create(id: 1, user: @user, name: 'Fridge')
    @foods = [
      Food.create(name: 'Apples', measurement_unit: 'grams', price: 5),
      Food.create(name: 'Bread', measurement_unit: 'grams', price: 10)
    ]

    @recipe_foods = []
    @inventory_foods = []
    @remaining_quantities = []
    @price_diffs = []

    @foods.each_with_index do |food, index|
      @recipe_foods << RecipeFood.create(recipe: @recipe, food:, quantity: (index * 4) + 1)
      @inventory_foods << InventoryFood.create(inventory: @inventory, food:, quantity: index + 2)
      @remaining_quantities << (@recipe_foods[index].quantity - @inventory_foods[index].quantity)
      @price_diffs << ((food.price * @recipe_foods[index].quantity) - (food.price * @inventory_foods[index].quantity))
    end

    sign_in @user # Creates session
  end

  context 'index page' do
    before { visit "/shopping_lists?recipe_id=#{@recipe.id}&inventory_id=#{@inventory.id}" }

    it 'has the total amount of food to buy' do
      remaining_foods = @price_diffs.count { |total_price| total_price > 0 }
      expect(page).to have_content("Amount of food to buy: #{remaining_foods}")
    end

    it 'has total value of the needed foods' do
      total_price_needed = @price_diffs.select { |total_price| total_price > 0 }.sum
      expect(page).to have_content("Total value of food needed: $#{total_price_needed}")
    end

    it 'has a link to the recipe show page' do
      expect(page).to have_content("Recipe: #{@recipe.name}")
      click_link @recipe.name
      expect(current_path).to eq(recipe_path(@recipe))
    end

    it 'has a link to the inventory show page' do
      expect(page).to have_content("Inventory: #{@inventory.name}")
      click_link @inventory.name
      expect(current_path).to eq(inventory_path(@inventory))
    end

    it 'has only the required foods listed' do
      @foods.each_with_index do |food, index|
        next unless @price_diffs[index] > 0

        expect(page).to have_content(food.name)
        expect(page).to have_content("#{@remaining_quantities[index]} #{food.measurement_unit}")
        expect(page).to have_content("$#{@price_diffs[index]}")
      end
    end
  end
end
