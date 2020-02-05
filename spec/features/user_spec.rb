require 'rails_helper'
require 'support/test_helpers'

RSpec.configure do |c|
  c.include TestHelper
end

RSpec.feature 'Users', type: :feature do
  context 'create user' do
    scenario 'Should be successful' do
      correct_signup_user
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'Should fail' do
      wrong_signup_user
      expect(page).to have_content('First name can\'t be blank')
    end
  end

  context 'edit current user' do
    subject do
      create_user
    end
    before { subject.save }

    before(:each) do
      login_user
    end

    scenario 'Should be successful' do
      visit edit_user_registration_path
      expect(page).to have_content('Edit User')
      edit_user
      expect(page).to have_content('Your account has been updated successfully.')
    end
  end
end
