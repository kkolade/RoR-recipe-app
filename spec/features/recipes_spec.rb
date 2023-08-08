require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers # Allows us to create a devise session

  before do
    @user = User.create(id: 1, name: 'Jose', email: 'test@example.com', password: '123456')
    @recipe = Recipe.create(user_id: @user.id, name: 'Apple pie', description: 'pie made with apples', is_public: true,
                            preparation_time: 10, cooking_time: 20)
    sign_in @user # Creates session
  end

  context 'public index page' do
    before { visit root_path }

    it "has the user's and recipe's names" do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content("By: #{@recipe.user.name}")
    end

    it 'has the text of the totals' do # and in the future the totals will be calculated
      expect(page).to have_content('Total food items:')
      expect(page).to have_content('Total price:')
    end
  end
end
