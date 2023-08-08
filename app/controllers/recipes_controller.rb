class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_index
    @recipes = Recipe.includes(:user).where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
