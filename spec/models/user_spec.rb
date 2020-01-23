require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations' tests

  let(:user) { User.new(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: '123456', password_confirmation: '123456', birthday: Time.now - 18.years, gender: 'male') }

  context 'validation tests' do
    # Name validations

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

    # Email validations
    # already checked by devise

    # password validations
    # already checked by devise gem

    # password_confirmation validations
    # already checked by devise gem

    # Birthday validations

    it 'User must have a birthday' do
      user.birthday = nil
      expect(user).to_not be_valid
    end

    # Gender validations

    it 'user must have a gender' do
      user.gender = nil
      expect(user).to_not be_valid
    end
  end

  # Associations' tests

  context 'Associations tests' do
    it 'User has many posts' do
      user = User.reflect_on_association(:posts)
      expect(user.macro).to eq(:has_many)
    end
  end
end
