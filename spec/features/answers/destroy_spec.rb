require 'rails_helper'

feature 'User can delete own answers', %q(
  In order to delete own answers
  As an authenticated user and author
  I'd like to be able to delete my own answers
) do

  given!(:users) { create_list(:user, 3) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: users[0]) }

  describe 'Authenticated user', js: true do

    scenario 'tries to delete own answer' do
      sign_in(users[0])
      visit question_path(question)
      click_on 'delete'
      page.driver.browser.switch_to.alert.accept

      expect(page).to_not have_content answer.body
    end

    scenario "tries to delete someone else's answer" do
      sign_in(users[1])
      visit question_path(question)
      expect(page).to_not have_link 'delete'
    end
  end

  scenario 'Unauthenticated user tries to delete answer' do
    visit question_path(question)

    expect(page).to_not have_content 'delete'
  end
end
