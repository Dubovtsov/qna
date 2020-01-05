require 'rails_helper'

feature 'User can view the question and answer to it', %q{
  In order to view question
  As an user
  I'd like to be able to see question with answers
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answers) { create_list(:answer, 2, question: question, user: user) }

  background do
    sign_in(user)
    visit question_path(question)
    expect(page).to have_content(question.title)
  end

  scenario 'Any user can show question with answer' do
    expect(page).to have_content(answers.first.body)
    expect(page).to have_content(answers.last.body)
  end
end
