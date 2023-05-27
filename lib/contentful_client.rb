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
    Rails.cache.fetch("recipe_id_#{content_id}", expires_in: 12.hours) do
      @client.entry(recipe_id)
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
