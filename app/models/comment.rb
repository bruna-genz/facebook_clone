class Comment < ApplicationRecord
    validates :comment, presence: true, length: { in: 2..240 }

    has_many :likes, as: :likeable
end
