require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  
  subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }
  before { subject.save }

  context 'create post' do
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
      expect(page).to have_content('Post created')
    end

    scenario 'Should fail' do
      visit root_path
      click_button 'Create post'
      expect(page).to have_content('Content can\'t be blank')
    end
  end
end
