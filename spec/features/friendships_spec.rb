require 'rails_helper'
require 'support/test_helpers'
require 'support/factory_bot'

RSpec.configure do |c|
  c.include TestHelper
end

RSpec.feature 'Friendships', type: :feature do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user2) }

  context 'accepting friendship' do
    before(:each) do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: user2.email
        fill_in 'Password', with: user2.password
      end
      click_button 'Log in'
      Friendship.create(user_id: user1.id, friend_id: user2.id)
      visit find_friends_path
    end

    scenario 'Successful friendship acceptance' do
      find('.confirm-btn').click
      expect(page).to have_content('You have a new friend :)')
    end

    scenario 'Successful friendship denial' do
      find('.cancel-request').click
      expect(page).to have_content('Friendship request denied')
    end
  end
end
