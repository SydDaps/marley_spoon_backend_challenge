# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = ContentfulClient.instance.recipes
  end

  def show
    @recipe = ContentfulClient.instance.recipe(recipe_id)
  end

  private

  def recipe_id
    allowed_params = params.permit(:id)
    allowed_params[:id]
  end
end
