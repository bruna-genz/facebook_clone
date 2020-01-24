require 'rails_helper'
require 'support/test_helpers'

RSpec.configure do |c|
  c.include TestHelper
end

RSpec.feature 'Comments', type: :feature do
    subject do
        create_user
      end
    before { subject.save }


    context 'request friendship' do
        before(:each) do
            login_user
            visit find_friends_path
        end

        scenario 'Successful friendship request' do
            find('.request-btn').click
            expect(page).to have_content('pending request')
        end
    end
    context 'accepting friendship' do

        scenario 'Successful friendship acceptance' do
            find('.accept-btn').click
            expect(page).to have_content('You have a new friend :)')
        end
        
        scenario 'Successful friendship denial' do
            find('.deny-btn').click
            expect(page).to have_content('friendship request denied')
        end
    end
  
end
