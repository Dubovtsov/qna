require 'rails_helper'

feature 'User can view a list of questions', %q{
  to find interesting question
  As an unauthenticated user
  I'd like to be able to ask the question
} do

  given!(:questions) { create_list(:question, 3) }

  scenario 'Any user view questions' do
    visit questions_path

    questions.each do |question|
      # save_and_open_page
      expect(page).to have_content question.title
      expect(page).to have_content question.body
    end
  end
end
