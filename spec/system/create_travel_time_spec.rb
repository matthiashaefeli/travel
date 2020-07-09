require 'rails_helper'

RSpec.describe 'create travel time', type: :system do
  it 'error with blank inputs' do
    login_as(FactoryBot.create(:user))
    visit travel_times_path
    click_on 'travelTimeFormLink'
    click_on 'Search'
    expect(page).to have_content('Please enter Start and End Location')
  end

  it 'creates travel time successfully' do
    login_as(FactoryBot.create(:user))
    visit travel_times_path
    click_on 'travelTimeFormLink'
    fill_in 'start_point', with: 'Santa fe'
    fill_in 'end_point', with: 'Rio Rancho'
    click_on 'Search'
    expect(page).to have_content('Santa Fe, NM, USA')
  end
end