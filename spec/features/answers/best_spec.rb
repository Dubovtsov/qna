require 'rails_helper'

feature 'The user can choose the best answer to his question', %q{
  In order for other users to find the correct answer
  As an authenticated user
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
      click_on 'Best answer', match: :first

      expect(current_path).to eq question_path(question)
      expect(page).to have_content 'The best'
    end

    scenario 'mark another answer as the best' do
      visit question_path(question)

      within "#answer-#{answers.last.id}" do
        click_on 'Best answer'
      end

      within first('.answers') do
        expect(page).to have_content answers.last.body
      end
    end
  end

  scenario 'Unauthenticated user tries to choose the best answer' do
    visit question_path(question)
    expect(page).to_not have_content 'Best answer'
  end
end
