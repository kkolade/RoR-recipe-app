require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user

    @recipe = FactoryBot.create(:recipe, user: @user)

    @recipe_foods = [FactoryBot.create(:recipe_food, recipe: @recipe)]
  end

  it 'renders the recipe details' do
    render

    expect(rendered).to have_content @recipe.name
    expect(rendered).to have_content "#{@recipe.preparation_time} minutes"
    expect(rendered).to have_content "#{@recipe.cooking_time} minutes"
    expect(rendered).to have_content @recipe.description
    expect(rendered).to have_content 'Public:'

    if @recipe.user == @user
      expect(rendered).to have_button('Yes')
    else
      expect(rendered).to have_button('No')
    end

    if @recipe.user == @user
      expect(rendered).to have_link('Add ingredient')
    else
      expect(rendered).not_to have_link('Add ingredient')
    end

    if @recipe.is_public || @recipe.user == @user
      expect(rendered).to have_link('Generate shopping list')
    else
      expect(rendered).not_to have_link('Generate shopping list')
    end

    @recipe_foods.each do |recipe_food|
      expect(rendered).to have_content recipe_food.food.name
      expect(rendered).to have_content "#{recipe_food.quantity} #{recipe_food.food.measurement_unit}"
      expect(rendered).to have_content "#{(recipe_food.quantity * recipe_food.food.price).to_i} $"
      expect(rendered).to have_link('Edit')
      expect(rendered).to have_button('Delete')
    end
  end
end
