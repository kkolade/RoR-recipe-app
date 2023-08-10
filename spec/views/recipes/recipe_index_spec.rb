require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)
    allow(view).to receive(:current_user).and_return(@user)

    @recipe1 = FactoryBot.create(:recipe, user: @user)

    assign(:recipes, [@recipe1])

    render
  end

  it 'renders a list of recipes' do
    assert_select '.recipeTitle', text: @recipe1.name, count: 1
    assert_select '.recipeDesc', text: "Description: #{@recipe1.description}", count: 1
  end
end
