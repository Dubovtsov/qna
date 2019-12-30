require 'rails_helper'

feature 'User can delete question', %q{
  In order to get answer from a community
  As an authenticated user
  I'd like to be able to delete the question
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given(:answers) { create_list(:answer, 2, question: question, user: user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      # visit questions_path
    end

    scenario 'delete a question' do
      visit question_path(question)
      click_on 'delete'

      expect(page).to have_content 'Your question deleted successfully.'
    end
  end

  scenario "remove another user's question" do
    visit question_path(question)
    # save_and_open_page
    expect(page).to_not have_content 'delete'
  end
end
