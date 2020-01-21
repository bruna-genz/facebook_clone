class Like < ApplicationRecord
    belongs_to :likeable, polymorphic: true, optional: true
    belongs_to :liker, foreign_key: :liker_id, class_name: 'User'
end
