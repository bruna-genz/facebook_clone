class Post < ApplicationRecord
    validates :content, presence: true, length: { in: 2..240 }
end
