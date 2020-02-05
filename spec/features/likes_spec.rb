require 'rails_helper'
require 'support/test_helpers'

RSpec.configure do |c|
  c.include TestHelper
end

RSpec.feature 'Likes', type: :feature do
  subject do
    User.new(first_name: 'John',
             last_name: 'Doe',
             email: 'john.doe@example.com',
             password: '123456',
             password_confirmation: '123456',
             birthday: Time.now - 18.years,
             gender: 'male')
  end
  before { subject.save }

  context 'like post' do
    before(:each) do
      login_user
    end

    scenario 'Should be successful' do
      visit root_path
      within('form') do
        fill_in 'Create post', with: 'This is a post'
      end
      click_button 'Create post'
      find('.like-btn').click
      find('#liker-name').should have_content('John')
    end
  end
end
