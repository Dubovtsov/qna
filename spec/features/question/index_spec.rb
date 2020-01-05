require 'rails_helper'

feature 'User can view a list of questions', %q{
  to find interesting question
  As an unauthenticated user
  I'd like to be able to ask the question
} do

  given!(:questions) { create_list(:question, 3) }

  scenario 'Any user view questions' do
    visit root_path

    questions.each do |question|
      expect(page).to have_content question.title
    end
  end
end
