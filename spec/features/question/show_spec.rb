require 'rails_helper'

feature 'User can view the question with answers', %q{
  In order to view question with answers
  As a user
  I'd like to be able to view the question with answers
} do

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:answers) { create_list(:answer, 4, question: question, user: user) }

  background do
    sign_in(user)
    visit question_path(question)
    expect(page).to have_content(question.title)
  end

  scenario 'Any user can view the question with answers' do
    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end
end
