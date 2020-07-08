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
end