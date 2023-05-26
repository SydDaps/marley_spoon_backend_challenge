# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContentfulClient do
  let(:mock_entries) { Contentful::Array.new({}) }

  it "should return all recipes in Contentful::Array class" do
    recipes = ContentfulClient.instance.recipes

    expect(recipes.class).to eq(Contentful::Array)
  end

  it "should return recipe with content id" do
    recipe = ContentfulClient.instance.recipe '4dT8tcb6ukGSIg2YyuGEOm'
    expect(recipe.title).to eq("White Cheddar Grilled Cheese with Cherry Preserves & Basil")
  end
end