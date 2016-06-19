class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # First and last name
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Folowers
  has_many :passive_relationships,
    class_name: 'Relationship',
    foreign_key: 'following_id',
    dependent: :destroy

  has_many :active_relationships,
    class_name: 'Relationship',
    foreign_key: 'follower_id',
    dependent: :destroy

  has_many :followers, through: :passive_relationships
  has_many :following, through: :active_relationships

  def follow(other_user)
    active_relationships.build(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy()
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
