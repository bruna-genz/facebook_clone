require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }
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
      within('form') do
        fill_in 'Create post', with: 'This is a post'
      end
      click_button 'Create post'
      within('form.new-comment') do
        fill_in 'Write a comment...', with: 'Hi this is my first comment'
      end
      find('.comment-btn').click
      find('#sub-content').should have_content('Hi this is my first comment')
    end

    scenario 'Should fail' do
      visit root_path
      within('form') do
        fill_in 'Create post', with: 'This is a post'
      end
      click_button 'Create post'
      find('.comment-btn').click
      expect(page).to have_content('It was not possible to create this comment')
    end
  end
end
