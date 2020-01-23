require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  
  subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }
  before { subject.save }

  context 'like post' do
    before(:each) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'Should be successful' do
      visit root_path
      within('form') do
        fill_in 'Create post', with: 'This is a post'
      end
      click_button 'Create post'
      find('.like-btn').click
      find("#liker-name").should have_content("John")
    end
  end
end
