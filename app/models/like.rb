class Like < ApplicationRecord
  belongs_to :post
  belongs_to :liker, foreign_key: :liker_id, class_name: 'User'
end
