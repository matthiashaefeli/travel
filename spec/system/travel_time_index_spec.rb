require 'rails_helper'

RSpec.describe 'travel time index', type: :system do
  describe 'index' do
    it 'has no access' do
      visit travel_times_path
      expect(page).to have_content('Sign In')
    end

    it 'shows travel time entry' do
      travel_time = FactoryBot.create(:travel_time, user: FactoryBot.create(:user))
      login_as(travel_time.user)
      visit travel_times_path
      expect(page).to have_content(travel_time.start_point)
    end

    it 'does not show travel time entry of other users' do
      travel_time = FactoryBot.create(:travel_time)
      login_as(FactoryBot.create(:user))
      visit travel_times_path
      expect(page).not_to have_content(travel_time.start_point)
    end
  end
end
