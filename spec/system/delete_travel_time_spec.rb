require 'rails_helper'

RSpec.describe 'delete travel time', type: :system do
  describe 'delete' do
    it 'travel time start point not there after delete' do
      travel_time = FactoryBot.create(:travel_time, user: FactoryBot.create(:user))
      login_as(travel_time.user)
      visit travel_times_path
      find('.fa-trash-alt').click
      expect(page).not_to have_content(travel_time.start_point)
    end
  end
end
