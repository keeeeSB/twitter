class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  scope :order_by_tweet_created_at, -> {
    includes(:tweet).references(:tweets).order("tweet.created_at DESC")
  }
end
