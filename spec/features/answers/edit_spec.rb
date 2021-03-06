require 'rails_helper'

feature 'User can edit his answer', %q{
  In order to correct mistakes
  As an author of answer
  I'd like ot be able to edit my answer
} do

  given!(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answer) { create(:answer, question: question, user: user) }

  scenario 'Unauthenticated can not edit answer' do
    visit question_path(question)

    expect(page).to_not have_link 'edit'
  end

  describe 'Authenticated user', js: true do

    scenario 'edits his answer' do
      sign_in user
      visit question_path(question)

      within '.answers' do
        click_on 'Edit'
        fill_in 'Body', with: 'edited answer'
        click_on 'save'

        expect(page).to_not have_content answer.body
        expect(page).to have_content 'edited answer'
        expect(page).to_not have_selector 'textarea'
      end
    end

    scenario 'edits his answer with errors' do
      sign_in user
      visit question_path(question)
      
      within ".answers" do
        click_on 'Edit'
        fill_in 'Body', with: ''
        click_on 'save'

        expect(page).to have_content answer.body
        expect(page).to have_selector 'textarea'
        expect(page).to have_content "Body can't be blank"
      end
    end

    scenario 'Author can add files when editing own answer' do
      sign_in user
      visit question_path(question)

      within '.answers' do
        expect(page).to_not have_link 'rails_helper.rb'
        expect(page).to_not have_link 'spec_helper.rb'

        click_on 'Edit'
        fill_in 'answer_body', with: 'edited answer'

        attach_file 'answer_files', ["#{Rails.root}/spec/rails_helper.rb", "#{Rails.root}/spec/spec_helper.rb"]
        click_on 'save'

        expect(page).to have_link 'rails_helper.rb'
        expect(page).to have_link 'spec_helper.rb'
      end
    end

    scenario 'tries to edit other users question' do
      visit question_path(question)

      expect(page).to_not have_link 'Edit'
    end
  end
end
