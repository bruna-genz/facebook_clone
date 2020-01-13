class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  ## Name
  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
end
