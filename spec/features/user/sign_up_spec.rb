require 'rails_helper'

feature 'User can sign up', %q{
  In order to ask questions and give answers
  As an unauthenticated user
  I'd like to be able to sign up
} do

  background { visit new_user_registration_path }

  scenario 'User can signup' do
    fill_in 'Email', with: 'test@test.ru'
    fill_in 'Password', with: '12345678'

    click_on 'Sign up'
  end

  scenario 'User tries to sign in with invalid data' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_on 'Sign up'

    expect(page).to have_text 'error'
  end
end
