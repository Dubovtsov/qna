require 'rails_helper'

feature 'User can delete own answers', %q(
  In order to delete own answers
  As an authenticated user and author
  I'd like to be able to delete my own answers
) do

  given!(:users) { create_list(:user, 3) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: users[0]) }

  describe 'Authenticated user' do

    scenario 'tries to delete own answer', js: true do
      sign_in(users[0])
      visit question_path(question)
      click_on 'Delete'
      page.driver.browser.switch_to.alert.accept

      expect(page).to_not have_content answer.body
    end

    scenario "tries to delete someone else's answer" do
      sign_in(users[1])
      visit question_path(question)
      expect(page).to_not have_link 'Delete'
    end
  end

  scenario 'Author can remove any of the attached files to your answer', js: true do
    sign_in(users[0])
    visit question_path(question)

    within '.answers' do
      click_on 'Edit'
      fill_in 'Body', with: 'edited question'
      attach_file 'answer_files', ["#{Rails.root}/spec/rails_helper.rb", "#{Rails.root}/spec/spec_helper.rb"]
      click_on 'save'
    end

    within ".files" do
      click_on 'delete', match: :first
      page.driver.browser.switch_to.alert.accept

      expect(page).to_not have_link 'rails_helper.rb'
      expect(page).to have_link 'spec_helper.rb'
    end
  end

  scenario 'Unauthenticated user tries to delete answer' do
    visit question_path(question)

    expect(page).to_not have_content 'Delete'
  end
end
