require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'association tests' do
    it 'friendship belongs to a user' do
      friendship = Friendship.reflect_on_association(:user)
      expect(friendship.macro).to eq(:belongs_to)
    end

    it 'friendship belongs to a friend' do
      friendship = Friendship.reflect_on_association(:friend)
      expect(friendship.macro).to eq(:belongs_to)
    end
  end
end
