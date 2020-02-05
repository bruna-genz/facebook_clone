require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations' tests

  let(:user) do
    User.new(first_name: 'John', last_name: 'Doe',
             email: 'john.doe@example.com',
             password: '123456', password_confirmation: '123456',
             birthday: Time.now - 18.years, gender: 'male')
  end

  context 'Name validation tests' do
    it 'user must have a first name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it 'user must have a last name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it 'first name length should be between 2 and 30 characters' do
      user.first_name = 'J'
      expect(user).to_not be_valid
    end

    it 'first name length should be between 2 and 30 characters' do
      user.first_name = 'J' * 31
      expect(user).to_not be_valid
    end

    it 'last name length should be between 2 and 30 characters' do
      user.last_name = 'D'
      expect(user).to_not be_valid
    end

    it 'last name length should be between 2 and 30 characters' do
      user.last_name = 'D' * 31
      expect(user).to_not be_valid
    end
  end

  context 'Birthday validation tests' do
    it 'User must have a birthday' do
      user.birthday = nil
      expect(user).to_not be_valid
    end
  end

  context 'Gender validation tests' do
    it 'user must have a gender' do
      user.gender = nil
      expect(user).to_not be_valid
    end
  end

  # Associations' tests

  context 'Posts associations tests' do
    it 'User has many posts' do
      user = User.reflect_on_association(:posts)
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Comments associations tests' do
    it 'User has many comments' do
      user = User.reflect_on_association(:comments)
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Likes associations tests' do
    it 'User has many likes' do
      user = User.reflect_on_association(:likes)
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Friendships associations tests' do
    it 'User has many friendships' do
      user = User.reflect_on_association(:friendships)
      expect(user.macro).to eq(:has_many)
    end

    it 'User has many inverse_friendships' do
      user = User.reflect_on_association(:inverse_friendships)
      expect(user.macro).to eq(:has_many)
    end
  end
end
