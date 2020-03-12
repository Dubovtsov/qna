require 'rails_helper'

feature 'User can add links to answer', %q{
  In order to provide additional info to my answer
  As an answer's author
  I'd like to be able to add links
} do 

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given(:gist_url) { 'https://gist.github.com/Dubovtsov/b1b4d2310cec6264d315d057cb4e223a' }

  scenario 'User adds link when give an answer', js: true do
    sign_in(user)
    visit question_path(question)

    fill_in 'answer_body', with: 'text text'

    fill_in 'Link name', with: 'My gist'
    fill_in 'URL', with: gist_url
    save_and_open_page
    click_on 'Reply'


    within '.answers' do
      expect(page).to have_link 'My gist', href: gist_url
    end
  end
end