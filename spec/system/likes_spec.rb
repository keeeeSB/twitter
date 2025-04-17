require 'rails_helper'

RSpec.describe "いいね機能", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:tweet) { FactoryBot.create(:tweet, user: other_user) }

  before do
    sign_in user
    visit tweets_path
  end

  scenario "ユーザーは自分以外のツイートにいいねができる" do
    visit user_tweet_path(other_user, tweet)
    expect {
      find(".like-button").click
    }.to change(Like, :count).by(1)

    expect(page).to have_content "いいねしました。"
    expect(current_path).to eq user_tweet_path(other_user, tweet)
  end
end
