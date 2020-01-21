require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  subject { Post.new(content: 'Hello World!', creator_id: 1) }
  before { subject.save }

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
      click_link "Like"
      expect('#liker-name').to have_content('You')
    end
  end
end
