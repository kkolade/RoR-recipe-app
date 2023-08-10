require 'rails_helper'

RSpec.describe 'Recipes', type: :model do
  before do
    @user = User.create(id: 1, name: 'Jose', email: 'test@example.com', password: '123456')
    @recipe = Recipe.create(user: @user, name: 'Apple pie', description: 'pie made with apples', is_public: true,
                            preparation_time: 10, cooking_time: 20)
  end

  context '#data' do
    it 'user_id should be present' do
      @recipe.user_id = nil
      expect(@recipe).to_not be_valid
    end

    it 'name should be present and not exceed 250 characters' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid

      @recipe.name = 'a' * 250
      expect(@recipe).to be_valid

      @recipe.name = 'a' * 251
      expect(@recipe).to_not be_valid
    end

    it 'is_public should be bool' do
      @recipe.is_public = false
      expect(@recipe).to be_valid

      @recipe.is_public = true
      expect(@recipe).to be_valid
    end

    it 'preparation_time should be present and greater than or equal to zero' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid

      @recipe.preparation_time = 0
      expect(@recipe).to be_valid
    end

    it 'cooking_time should be present and greater than or equal to zero' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid

      @recipe.cooking_time = 0
      expect(@recipe).to be_valid
    end
  end
end
