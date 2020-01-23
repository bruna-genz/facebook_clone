require 'rails_helper'

RSpec.describe Like, type: :model do
  # Associations' tests

  context 'Associations tests' do
    it 'like belongs to posts' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
    end

    it 'like belongs to user' do
      like = Like.reflect_on_association(:liker)
      expect(like.macro).to eq(:belongs_to)
    end
  end
end
