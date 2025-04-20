class Tweet < ApplicationRecord
  mount_uploader :tweet_image, TweetImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_user, through: :likes, source: :user

  validates :content, presence: true, length: { maximum: 100 }
end
