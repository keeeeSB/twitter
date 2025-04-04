class TweetsController < ApplicationController
  before_action :set_tweet, only: [ :edit, :update, :destroy ]

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = "ツイートしました。"
      redirect_to events_path
    else
      flash.now[:danger] = "ツイートできませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      flash[:success] = "ツイートを更新しました。"
      redirect_to tweets_path
    else
      flash.now[:danger] = "ツイートを更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy!
    flash[:success] = "ツイートを削除しました。"
    redirect_to tweets_path, status: :see_other
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content, :image)
    end

    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end
end
