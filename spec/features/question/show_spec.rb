require 'rails_helper'

feature 'User can view the question and answer to it', %q{
  In order to view question
  As an user
  I'd like to be able to see question with answers
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question) }
  given(:answers) { create_list(:answer, 2, question: question) }

  scenario 'Any user can show question with answer' do
    visit question_path(question)
    save_and_open_page
    expect(page).to have_content(question.title)
    expect(page).to have_content(answers.first.body)
    expect(page).to have_content(answers.last.body)
  end

  scenario 'asks a question' do
    # byebug
    fill_in 'Body', with: 'Answer first'
    click_on 'Reply'

    expect(page).to have_content 'Your question successfully created.'
    expect(page).to have_content 'Test question'
    expect(page).to have_content 'Answer first'
  end
end
