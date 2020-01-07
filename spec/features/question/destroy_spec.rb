require 'rails_helper'

feature 'User can delete a question', %q{
  In order to delete a question
  As an authenticated user
  I'd like to be able to delete the question
} do

  given!(:users) { create_list(:user, 2) }
  given!(:question) { create(:question, user: users[0]) }
  given(:answers) { create_list(:answer, 2, question: question, user: users[0]) }

  describe 'Authenticated user' do

    scenario 'delete a question' do
      sign_in(users[0])
      visit question_path(question)
      click_on 'delete'

      expect(page).to have_content 'Your question deleted successfully.'
    end

    scenario "remove another user's question" do
      sign_in(users[1])
      visit question_path(question)

      expect(page).to_not have_content 'delete'
    end
  end

  scenario "unauthenticated user tries to delete a question" do
    visit question_path(question)

    expect(page).to_not have_content 'delete'
  end
end
