require 'rails_helper'

feature 'User can logout', %q{
  In order to ask questions
  As an authenticated user
  I'd like to be able to logout
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user tries to logout' do
    sign_in(user)
    visit root_path

    click_on 'Logout'

    expect(page).to have_content 'Signed out successfully.'
  end

end
