require 'rails_helper'

feature 'User can delete own answers', %q(
  In order to delete own answer
  As an authenticated user and author
  I'd like to be able to delete the answer
) do

  # given(:user) { create(:user) }
  given!(:users) { create_list(:user, 3) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: users[0]) }

  describe 'Authenticated user' do
    # background do
    #   visit question_path(question)
    # end

    scenario 'tries to delete own answer' do
      sign_in(users[0])
      visit question_path(question)

      click_on 'delete'

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
