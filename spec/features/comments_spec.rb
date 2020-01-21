require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }
  before { subject.save }

  subject { Post.new(content: 'Hello World!', creator_id: 1) }
  before { subject.save }

  context 'comment post' do
    before(:each) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'Should be a successful comment' do
      visit root_path
      
      within('#comment-form') do
        fill_in 'comment...', with: 'Hi this is my first comment'
      end
      click_button 'Comment'
      expect('#comment').to have_content('Hi this is my first comment')
    end
    scenario 'Should fail' do
      visit root_path
      click_button 'Comment'
      expect(page).to have_content('Content can\'t be blank')
    end
  end
end
