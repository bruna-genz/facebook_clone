require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { Comment.new(sub_content: 'This is a comment.') }

  # Validations test
  context 'validation tests' do
    it 'comment must have a content' do
      comment.sub_content = nil
      expect(comment).to_not be_valid
    end

    it 'comment length should be between 2 and 240' do
      comment.sub_content = 'P'
      expect(comment).to_not be_valid
    end

    it 'comment length should be between 2 and 240' do
      comment.sub_content = 'P' * 242
      expect(comment).to_not be_valid
    end
  end

  # Associations' tests
  context 'Associations tests' do
    it 'comment has one creator' do
      comment = Comment.reflect_on_association(:commenter)
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'comment belongs to post' do
      comment = Comment.reflect_on_association(:post)
      expect(comment.macro).to eq(:belongs_to)
    end
  end
end
