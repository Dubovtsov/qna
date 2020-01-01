require 'rails_helper'

feature 'User can delete own answers', %q(
  In order to delete own answer
  As an authenticated user and author
  I'd like to be able to delete the answer
) do

  given(:user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      visit question_path(question)
    end

    scenario 'tries to delete own answer' do
      click_on 'delete'

      expect(page).to_not have_content answer.body
    end

    scenario "tries to delete someone else's answer" do
      expect(page).to_not have_content 'delete'
    end
  end

  scenario 'Unauthenticated user tries to delete answer' do
    visit question_path(question)

    expect(page).to_not have_content 'delete'
  end
end
