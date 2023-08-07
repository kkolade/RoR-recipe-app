class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_index
    @recipes = Recipe.all
  end
end
