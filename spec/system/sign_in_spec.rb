require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  context 'valid credentials' do
    it 'lets the user in' do
      user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      expect(page).to have_content('Sign Out')
    end
  end

  context 'invalid credentials' do
    it 'does not let the user in' do
      visit new_user_session_path
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'badpassword'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
