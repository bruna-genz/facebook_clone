class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :birthday, presence: true
  validates :gender, presence: true

  # Associations
  has_many :posts, foreign_key: 'creator_id', dependent: :destroy
  has_many :likes, foreign_key: 'liker_id', dependent: :destroy
  has_many :comments, foreign_key: 'commenter_id', dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  # Methods
  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
  end
end
