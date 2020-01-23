require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create user' do
    scenario 'Should be successful' do
      visit root_path
      within('.sign-up-form') do
        fill_in 'First name', with: 'User'
        fill_in 'Last name', with: 'User'
        fill_in 'Email', with: 'user@aa.com'
        fill_in 'Birthday', with: Time.now - 18.years

        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'Should fail' do
      visit root_path
      within('.sign-up-form') do
        fill_in 'Last name', with: 'User'
        fill_in 'Email', with: 'user@aa.com'
        fill_in 'Birthday', with: Time.now - 18.years

        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('First name can\'t be blank')
    end
  end

  context 'edit current user' do
    subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }
    before { subject.save }

    before(:each) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'Should be successful' do
      visit edit_user_registration_path
      expect(page).to have_content('Edit User')
      within('.edit_user_form') do
        fill_in 'Last name', with: 'User'
        fill_in 'Email', with: 'user@aa.com'
        fill_in 'Birthday', with: Time.now - 18.years
        select 'female', from: 'Gender'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        fill_in 'Current password', with: '123456'
      end
      click_button 'Update'
      expect(page).to have_content('Your account has been updated successfully.')
    end
  end
end
