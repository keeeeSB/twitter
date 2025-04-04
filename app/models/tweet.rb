class Tweet < ApplicationRecord
  mount_uploader :tweet_image, TweetImageUploader

  belongs_to :user

  validates :content, presence: true, length: { maximum: 100 }
end
