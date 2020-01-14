require 'rails_helper'

feature 'User can view a list of questions', %q{
  in order to find interesting question
  As an unauthenticated user
  I'd like to be able to view a list questions
} do

  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 5, user: user) }

  scenario 'Any user views questions' do
    visit root_path

    questions.each do |question|
      expect(page).to have_content question.title
    end
  end
end
