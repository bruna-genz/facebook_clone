class Comment < ApplicationRecord
  validates :sub_content, presence: true, length: { in: 2..240 }

  belongs_to :commenter, foreign_key: :commenter_id, class_name: 'User'
  belongs_to :post

  # default_scope -> { order(created_at: :desc) }
end
