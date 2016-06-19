class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # First and last name
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Friendships TODO: change to follow/unfollow
  has_many :friendships
  has_many :friends, through: :friendships
end
