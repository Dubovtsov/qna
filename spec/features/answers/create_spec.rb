require 'rails_helper'

feature 'User can create an answer', %q{
  In order to get an answer from a community
  As an authenticated user
  I'd like to be able to create an answer
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given(:answers) { create_list(:answer, 2, question: question, user: user) }

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit questions_path
      click_on 'MyString'
    end

    scenario 'give an answer' do
      fill_in 'answer_body', with: 'text text'
      click_on 'Reply'

      expect(current_path).to eq question_path(question)
      expect(page).to have_content 'Your answer successfully created.'
      within '.answers' do
        expect(page).to have_content 'text text'
      end
    end

    scenario 'give an answer with errors' do
      click_on 'Reply'

      expect(page).to have_content "Body can't be blank"
    end

    scenario 'give an answer with attached file' do
      fill_in 'answer_body', with: 'text text text'

      attach_file 'answer_files', ["#{Rails.root}/spec/rails_helper.rb", "#{Rails.root}/spec/spec_helper.rb"]
      click_on 'Reply'

      expect(page).to have_link 'rails_helper.rb'
      expect(page).to have_link 'spec_helper.rb'
    end
  end

  scenario 'Unauthenticated user tries to give an answer' do
    visit root_path
    click_on 'MyString'

    expect(page).to_not have_content 'Reply'
  end
end
