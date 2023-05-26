class ContentfulClient
  include Singleton

  def initialize
    @client = new_client
  end

  def recipes
    @client.entries(content_type: 'recipe')
  end

  def recipe(content_id)
    @client.entry(content_id)
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