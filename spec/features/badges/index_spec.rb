require 'rails_helper'

feature 'User can see list own badges', %q{
  In order to click badges
  As an user
  I'd like to be able to see all own badges 
} do

  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:question1) { create(:question, user: user) }
  given!(:badge) { create(:badge, question: question, user: other_user) }
  given!(:badge1) { create(:badge, question: question1) }
  given!(:answer) { create(:answer, question: question, user: other_user, best: true) }
    
  
  describe 'Authenticated user' do 

    scenario 'Author best answer can see own badges' do 
      sign_in(other_user)
      click_on 'Badges'
      expect(page).to have_content question.title
      expect(page).to have_content badge.name
      expect(page).to have_css "img[src*='badge.png']"
    end

    scenario "User can't see other user badges" do 
      sign_in(user)
      click_on 'Badges'

      expect(page).to_not have_content question.title
      expect(page).to_not have_content badge.name
      expect(page).to_not have_css "img[src*='badge.png']"
    end

    scenario "Users can't see non-granting badges" do 
      sign_in(user)
      click_on 'Badges'

      expect(page).to_not have_content question1.title
      expect(page).to_not have_content badge1.name
      expect(page).to_not have_css "img[src*='badge.png']"
    end

    scenario 'user without badges cant see badges' do
      sign_in(user)
      click_on 'Badges'

      expect(page).to_not have_content question.title
      expect(page).to_not have_content badge.name
      expect(page).to_not have_css "img[src*='badge.png']"
    end

  end  

  describe 'NotAuthenticated user' do 

    scenario 'not see show badges link' do
      visit root_path

      expect(page).to_not have_content 'Badges'
    end  
  end 

end