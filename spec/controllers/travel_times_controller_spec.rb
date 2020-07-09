require 'rails_helper'

RSpec.describe TravelTimesController do
  describe 'index' do
    it 'redirect if not logged in' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end

    it 'render time travel index' do
      sign_in(FactoryBot.create(:user))
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'new' do
    it 'redirect if not logged in' do
      get :new
      expect(response).to redirect_to(new_user_session_url)
    end

    it 'render time travel index' do
      sign_in(FactoryBot.create(:user))
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'create' do
    it 'redirect if not logged in' do
      post :create
      expect(response).to redirect_to(new_user_session_url)
    end

    it 'creates new entry successfully' do
      sign_in(FactoryBot.create(:user))
      post :create, params: { start_point: 'Santa Fe',
                              end_point: 'Albuquerque' }
      expect(response).to render_template(partial: '_travel_time_row')
    end
  end
end