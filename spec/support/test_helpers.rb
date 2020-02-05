module TestHelper
  def create_user
    User.new(first_name: 'John',
             last_name: 'Doe',
             email: 'john.doe@example.com',
             password: '123456',
             password_confirmation: '123456',
             birthday: Time.now - 18.years,
             gender: 'male')
  end

  def create_user2
    User.new(first_name: 'Mary',
             last_name: 'Doe',
             email: 'mary.doe@example.com',
             password: '123456',
             password_confirmation: '123456',
             birthday: Time.now - 18.years,
             gender: 'female')
  end

  def wrong_signup_user
    visit root_path
    within('.sign-up-form') do
      fill_in 'Last name', with: 'User'
      fill_in 'Email', with: 'user@aa.com'
      fill_in 'Birthday', with: Time.now - 18.years
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
    end
    click_button 'Sign up'
  end

  def correct_signup_user
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
  end

  def login_user
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: 'john.doe@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
  end

  def edit_user
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
  end

  def request_friendship
    Friendship.create(user_id: 2, friend_id: 1)
  end
end
