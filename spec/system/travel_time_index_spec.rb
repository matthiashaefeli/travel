require 'rails_helper'

RSpec.describe 'travel time index' do
  describe 'index' do
    it 'has no access' do
      visit travel_times_path
      expect(page).to have_content('Sign In')
    end

    it 'shows travel time entry' do
      login_as(FactoryBot.create(:user))
      travel_time = FactoryBot.create(:travel_time)
      visit travel_times_path
      expect(page).to have_content(travel_time.start_point)
    end
  end
end