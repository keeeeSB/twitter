class LikesController < ApplicationController
  before_action :set_tweet

  def index
    @likes = current_user.likes.order_by_tweet_created_at
  end

  def create
    @like = current_user.likes.create!(tweet_id: params[:tweet_id])
    flash[:success] = "いいねしました。"
    redirect_to user_tweet_path(@tweet.user, @tweet)
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: params[:tweet_id])
    @like.destroy!
    flash[:success] = "いいねを解除しました。"
    redirect_to user_tweet_path(@tweet.user, @tweet)
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
