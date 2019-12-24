require 'rails_helper'

feature 'User can signup', %q{
  In order to view question
  As an user
  I'd like to be able to see question with answers
} do

  given(:user) { create(:user) }

  scenario 'User can signup' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@test.ru'
    fill_in 'Password', with: '12345678'

    click_on 'Sign up'
  end

  # scenario 'asks a question' do
  #   # byebug
  #   fill_in 'Body', with: 'Answer first'
  #   click_on 'Reply'
  #
  #   expect(page).to have_content 'Your question successfully created.'
  #   expect(page).to have_content 'Test question'
  #   expect(page).to have_content 'Answer first'
  # end
end

    # save_and_open_page
