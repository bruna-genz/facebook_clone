require 'rails_helper'
require 'support/test_helpers'

RSpec.configure do |c|
  c.include TestHelper
end

RSpec.feature 'Friendships', type: :feature do
  User.create(first_name: 'John',
              last_name: 'Doe',
              email: 'john.doe@example.com',
              password: '123456',
              password_confirmation: '123456',
              birthday: Time.now - 18.years,
              gender: 'male')

  User.create(first_name: 'Mary',
              last_name: 'Doe',
              email: 'mary.doe@example.com',
              password: '123456',
              password_confirmation: '123456',
              birthday: Time.now - 18.years,
              gender: 'female')

  context 'request friendship' do
    scenario 'Successful friendship request' do
      login_user
      visit find_friends_path
      find('.add-friend').click
      expect(page).to have_selector(:link_or_button, 'Cancel request')
    end
  end
end
