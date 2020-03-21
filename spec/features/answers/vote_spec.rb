require 'rails_helper'

feature 'User can vote for the answer', %q(
  In order to raise the answer rate
  As an authenticated user
  I'd like to be able to vote for the answer
) do
  given(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question) }

  describe 'Authenticated user', js: true do
    given(:user) { create(:user) }
    given!(:owned_answer) { create(:answer, question: question, user: user) }

    background do
      login(user)
      visit question_path(question)
    end

    scenario 'can vote for the answer'
    scenario 'tries vote for the owned answer'

    scenario 'can vote down for the answer'

    scenario 'change vote'

    scenario "can't vote twice"

    scenario 'can see rate'
  end

  scenario "Unauthenticated user can't vote for the answer" do
    visit question_path(question)
    expect(page).to_not have_link 'Vote up'
    expect(page).to_not have_link 'Vote down'
  end
end