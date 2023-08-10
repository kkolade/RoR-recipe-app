require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /show' do
    it 'returns http success and displays recipe details' do
      @user = User.create(name: 'Fede', email: 'fede@gmail.com', password: '123456', password_confirmation: '123456')
      @recipe = Recipe.create(name: 'Pasta', preparation_time: 10, cooking_time: 20,
                              description: 'Delicious pasta recipe', user: @user)

      login_as(@user, scope: :user)

      get recipe_path(@recipe)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@recipe.name)
      expect(response.body).to include("#{@recipe.preparation_time} minutes")
      expect(response.body).to include("#{@recipe.cooking_time} minutes")
      expect(response.body).to include(@recipe.description)
    end
  end
end
