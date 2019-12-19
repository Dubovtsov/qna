require 'rails_helper'

feature 'User can create question', %q{
  In order to get answer from a community
  As an authenticated user
  I'd like to be able to ask the question
} do

  given(:user) { User.create!(email: 'user@test.com', password: '12345678') }

  scenario 'Authenticated user asks a question' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    # save_and_open_page
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Authenticated user asks a question with errors'
  scenario 'Unauthenticated user tries to asks a question'
end
