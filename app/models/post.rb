class Post < ApplicationRecord
    validates :content, presence: true, length: { in: 2..240 }

    belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
    has_many :comments
    has_many :likes, as: :likeable
end
