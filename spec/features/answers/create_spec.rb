require 'rails_helper'

feature 'User can create an answer', %q{
  In order to get an answer from a community
  As an authenticated user
  I'd like to be able to create an answer
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
      fill_in 'answer_body', with: 'text text'
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
    visit root_path
    click_on 'MyString'

    expect(page).to_not have_content 'Reply'
  end
end
