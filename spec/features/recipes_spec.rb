require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers # Allows us to create a devise session

  before do
    @user = User.create(id: 1, name: 'Jose', email: 'test@example.com', password: '123456')
    @recipe = Recipe.create(user: @user, name: 'Apple pie', description: 'pie made with apples', is_public: true)
    @food_one = Food.create(name: 'Apples', measurement_unit: 'grams', price: 5)
    @food_two = Food.create(name: 'Bread', measurement_unit: 'grams', price: 10)
    @recipe_foods = [
      RecipeFood.create(recipe: @recipe, food: @food_one, quantity: 2),
      RecipeFood.create(recipe: @recipe, food: @food_two, quantity: 3)
    ]

    sign_in @user # Creates session
  end

  context 'public index page' do
    before { visit root_path }

    it "has the user's and recipe's names" do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content("By: #{@recipe.user.name}")
    end

    it 'has the correct total price of the recipe' do
      total_price = (@food_one.price * @recipe_foods[0].quantity) + (@food_two.price * @recipe_foods[1].quantity)
      expect(page).to have_content("Total price: $#{total_price}")
    end

    it 'has the correct total food items of the recipe' do
      total_foods = @recipe_foods.select { |recipe_food| recipe_food.recipe == @recipe }
      expect(page).to have_content("Total food items: #{total_foods.length}")
    end
  end
end
