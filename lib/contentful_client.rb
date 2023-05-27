# frozen_string_literal: true

class ContentfulClient
  include Singleton

  def initialize
    @client = new_client
  end

  def recipes
    @client.entries(content_type: 'recipe')
  end

  def recipe(recipe_id)
    recipe = @client.entry(recipe_id)

    raise ApiException::RecipeNotFound, "recipe with id #{recipe_id} not found" unless recipe.present?

    Rails.cache.fetch("recipe_id_#{recipe_id}", expires_in: 12.hours) do
      recipe
    end
  end

  private

  def new_client
    Contentful::Client.new(
      space: ENV['SPACE_ID'],
      access_token: ENV['ACCESS_TOKEN'],
      environment: ENV['ENVIRONMENT_ID'],
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
