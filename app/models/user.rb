class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :profile_image, ProfileImageUploader

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  has_many :active_follows, class_name: "Follow",
                            foreign_key: :follwer_id,
                            dependent: :destroy
  has_many :followings, through: :active_follows, source: :follwed
  has_many :passive_follows, class_name: "Follow",
                             foreign_key: :followed_id,
                             dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  validates :name, presence: true
  validates :bio, length: { maximum: 50 }

  def follow(user)
    followings << user unless self == user
  end

  def unfollow(user)
    followings.destroy(user)
  end

  def following?(user)
    followings.include?(user)
  end
end
