require 'rails_helper'

feature 'User can create answer', %q{
  In order to get answer from a community
  As an authenticated user
  I'd like to be able to ask the question
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given(:answers) { create_list(:answer, 2, question: question, user: user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      visit questions_path
      click_on 'MyString'
    end

    scenario 'give an answer' do
      fill_in 'Body', with: 'text text'
      click_on 'Reply'

      expect(page).to have_content 'Your answer successfully created.'
      expect(page).to have_content 'text text'
    end

    scenario 'give an answer with errors' do
      click_on 'Reply'

      expect(page).to have_content "Answer can't be blank."
    end
  end

  scenario 'Unauthenticated user tries to give an answer' do
    visit questions_path
    click_on 'MyString'

    fill_in 'Body', with: 'text text'
    click_on 'Reply'
    save_and_open_page
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
