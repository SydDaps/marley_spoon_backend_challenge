# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe ':index' do
    it 'renders the index view', :vcr do
      get :index

      expect(response).to render_template(:index)
    end

    it 'displays a list of recipes', :vcr do
      get :index

      expect(response.body).to include('Tofu Saag Paneer with Buttery Toasted Pita')
    end
  end

  describe ':show' do
    it 'renders the show view', :vcr do
      get :show, params: { id: '5jy9hcMeEgQ4maKGqIOYW6' }

      expect(response).to render_template(:show)
    end

    it 'displays a list of movies', :vcr do
      get :show, params: { id: '5jy9hcMeEgQ4maKGqIOYW6' }

      expect(response.body).to include('Tofu Saag Paneer with Buttery Toasted Pita')
    end
  end
end
