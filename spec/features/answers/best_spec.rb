require 'rails_helper'

feature 'User can choose the best answer to your question', %q{
  In order to other users can find the correct answer
  As an guest and authenticated user
  I'd like to be able to note the correct answer
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answers) { create_list(:answer, 2, question: question, user: create(:user)) }

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit question_path(question)
    end

    scenario 'choose the best answer' do
      click_on 'Best answer'
      # выбрать по какой ссылке нажать

      expect(current_path).to eq question_path(question)
      expect(page).to have_content 'Your answer successfully created.'
      within '.answers' do
        expect(page).to have_content 'text text'
      end
    end
  end

  scenario 'Unauthenticated user tries to choose the best answer' do
    visit question_path(question)
    expect(page).to_not have_content 'Best answer'
  end
end
