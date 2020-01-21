class Comment < ApplicationRecord
    validates :comment, presence: true, length: { in: 2..240 }

    belongs_to :commenter, foreign_key: :commenter_id, class_name: 'User'
    belongs_to :post 

    has_many :likes, as: :likeable
end
