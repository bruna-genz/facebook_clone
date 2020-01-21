module Helpers
    module Authentication
      def sign_in_as(user)
        visit new_user_session_path
        within('form') do
            fill_in 'Email', with: 'john.doe@example.com'
            fill_in 'Password', with: '123456'
        end
        click_button 'Log in'
      end
    end
  end