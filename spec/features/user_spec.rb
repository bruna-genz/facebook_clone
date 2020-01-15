require 'rails_helper'

RSpec.feature "Users", type: :feature do


  context 'create user' do
    
    scenario 'Should be successful' do
        visit root_path
        within('.sign-up-form') do
          fill_in 'First name', with: 'User'
          fill_in 'Last name', with: 'User'
          fill_in 'Email', with: 'user@aa.com'
          fill_in 'Birthday', with: Time.now - 18.years
          fill_in 'Gender', with: 2
          fill_in 'Password', with: '123456'
          fill_in 'Password confirmation', with: '123456'
        end
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
  
end