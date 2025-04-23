module LikesHelper
  def like_button(user, tweet)
    if tweet.likes.exists?(user_id: user.id)
      link_to tweet_like_path(tweet, tweet.likes.find_by(user_id: user.id)),
              data: { turbo_method: :delete },
              class: "unlike-button" do
        image_tag "heart-fill.svg", alt: "いいね解除"
      end
    else
      link_to tweet_likes_path(tweet),
              data: { turbo_method: :post },
              class: "like-button" do
        image_tag "heart.svg", alt: "いいね"
      end
    end
  end

  def like_badge(user, tweet)
    if tweet.likes.exists?(user_id: user.id)
      image_tag "heart-fill.svg", width: 20, height: 20
    end
  end
end
